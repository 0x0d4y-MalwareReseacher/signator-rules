rule win_crat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.crat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.crat"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { e8???????? 488bd0 488d4d90 e8???????? 90 488bd0 }
            // n = 6, score = 500
            //   e8????????           |                     
            //   488bd0               | add                 edx, -0x18
            //   488d4d90             | dec                 ecx
            //   e8????????           |                     
            //   90                   | mov                 eax, esp
            //   488bd0               | dec                 eax

        $sequence_1 = { e8???????? 488bd0 488d8d60010000 e8???????? 90 }
            // n = 5, score = 500
            //   e8????????           |                     
            //   488bd0               | lea                 ecx, [ebp + 0xb8]
            //   488d8d60010000       | nop                 
            //   e8????????           |                     
            //   90                   | dec                 eax

        $sequence_2 = { e8???????? 488bd0 488d8db8000000 e8???????? 90 }
            // n = 5, score = 500
            //   e8????????           |                     
            //   488bd0               | dec                 eax
            //   488d8db8000000       | mov                 edx, eax
            //   e8????????           |                     
            //   90                   | dec                 eax

        $sequence_3 = { e8???????? 488bc8 4885c0 7433 }
            // n = 4, score = 500
            //   e8????????           |                     
            //   488bc8               | mov                 edx, eax
            //   4885c0               | dec                 eax
            //   7433                 | lea                 ecx, [ebp + 0x160]

        $sequence_4 = { e8???????? 488bd0 488d8d78010000 e8???????? 90 }
            // n = 5, score = 500
            //   e8????????           |                     
            //   488bd0               | cmp                 ecx, eax
            //   488d8d78010000       | je                  8
            //   e8????????           |                     
            //   90                   | nop                 

        $sequence_5 = { e8???????? 488bd0 488d8d70010000 e8???????? 90 }
            // n = 5, score = 500
            //   e8????????           |                     
            //   488bd0               | dec                 eax
            //   488d8d70010000       | mov                 edx, dword ptr [esp + 0x20]
            //   e8????????           |                     
            //   90                   | dec                 eax

        $sequence_6 = { 498bc4 48833d????????10 480f4305???????? 482bc8 }
            // n = 4, score = 500
            //   498bc4               | je                  0x38
            //   48833d????????10     |                     
            //   480f4305????????     |                     
            //   482bc8               | dec                 eax

        $sequence_7 = { 483bc8 7406 e8???????? 90 488b542420 4883c2e8 }
            // n = 6, score = 500
            //   483bc8               | nop                 
            //   7406                 | dec                 eax
            //   e8????????           |                     
            //   90                   | mov                 ecx, eax
            //   488b542420           | dec                 eax
            //   4883c2e8             | test                eax, eax

        $sequence_8 = { 33d2 c1e902 f7f1 eb02 }
            // n = 4, score = 300
            //   33d2                 | mov                 dword ptr [ebp - 0x28], edx
            //   c1e902               | mov                 dword ptr [ebp - 0x1c], edx
            //   f7f1                 | inc                 esi
            //   eb02                 | mov                 dword ptr [ebp - 4], 0

        $sequence_9 = { ffd0 85c0 750f ff15???????? }
            // n = 4, score = 300
            //   ffd0                 | dec                 eax
            //   85c0                 | mov                 edx, eax
            //   750f                 | dec                 eax
            //   ff15????????         |                     

        $sequence_10 = { 8d7118 57 83f810 7d08 51 }
            // n = 5, score = 200
            //   8d7118               | nop                 
            //   57                   | dec                 eax
            //   83f810               | mov                 edx, dword ptr [esp + 0x20]
            //   7d08                 | dec                 eax
            //   51                   | add                 edx, -0x18

        $sequence_11 = { 8b45cc 8b4db0 c740180d000000 89481c 83781800 0f85fd000000 807de100 }
            // n = 7, score = 200
            //   8b45cc               | dec                 eax
            //   8b4db0               | mov                 edx, eax
            //   c740180d000000       | dec                 eax
            //   89481c               | lea                 ecx, [ebp + 0xc8]
            //   83781800             | nop                 
            //   0f85fd000000         | call                eax
            //   807de100             | test                eax, eax

        $sequence_12 = { 8b4310 46 2b430c 8975e0 83f801 7d08 51 }
            // n = 7, score = 200
            //   8b4310               | mov                 eax, dword ptr [ebp - 0x34]
            //   46                   | mov                 ecx, dword ptr [ebp - 0x50]
            //   2b430c               | mov                 dword ptr [eax + 0x18], 0x10
            //   8975e0               | mov                 dword ptr [eax + 0x1c], ecx
            //   83f801               | mov                 eax, dword ptr [ebp - 0x34]
            //   7d08                 | mov                 ecx, dword ptr [ebp - 0x50]
            //   51                   | mov                 dword ptr [eax + 0x18], 0x10

        $sequence_13 = { e8???????? ffd0 8bf0 eb02 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   ffd0                 | dec                 eax
            //   8bf0                 | lea                 ecx, [ebp - 0x70]
            //   eb02                 | nop                 

        $sequence_14 = { 8b5508 0f57c0 56 8b750c b896000000 f30f7f01 8911 }
            // n = 7, score = 200
            //   8b5508               | dec                 eax
            //   0f57c0               | mov                 edx, eax
            //   56                   | dec                 eax
            //   8b750c               | mov                 edx, eax
            //   b896000000           | dec                 eax
            //   f30f7f01             | lea                 ecx, [ebp + 0x150]
            //   8911                 | nop                 

        $sequence_15 = { 8b45cc 8b4db0 c7401810000000 89481c }
            // n = 4, score = 200
            //   8b45cc               | jne                 0x13
            //   8b4db0               | call                eax
            //   c7401810000000       | test                eax, eax
            //   89481c               | jne                 0x13

        $sequence_16 = { 8b5508 56 8b0a 8b7204 }
            // n = 4, score = 200
            //   8b5508               | mov                 dword ptr [eax + 0x1c], ecx
            //   56                   | mov                 ecx, dword ptr [ebp + 8]
            //   8b0a                 | mov                 eax, dword ptr [ebp - 0x34]
            //   8b7204               | mov                 ecx, dword ptr [ebp - 0x50]

        $sequence_17 = { 8b30 8955d8 8955e4 46 c745fc00000000 8bdf 8975e0 }
            // n = 7, score = 200
            //   8b30                 | lea                 esp, [esp]
            //   8955d8               | mov                 al, byte ptr [ecx]
            //   8955e4               | mov                 edx, dword ptr [ebp + 8]
            //   46                   | push                esi
            //   c745fc00000000       | mov                 ecx, dword ptr [edx]
            //   8bdf                 | mov                 esi, dword ptr [edx + 4]
            //   8975e0               | lea                 esp, [esp]

    condition:
        7 of them and filesize < 4161536
}