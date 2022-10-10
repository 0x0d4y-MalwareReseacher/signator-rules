rule win_ati_agent_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.ati_agent."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ati_agent"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { 33c9 4c8d6108 4d8b2c24 eb20 4c8d2588c20000 488b0d???????? bf01000000 }
            // n = 7, score = 100
            //   33c9                 | dec                 eax
            //   4c8d6108             | mov                 dword ptr [esp + 0x20], eax
            //   4d8b2c24             | dec                 esp
            //   eb20                 | mov                 ecx, dword ptr [esp + 0x50]
            //   4c8d2588c20000       | dec                 esp
            //   488b0d????????       |                     
            //   bf01000000           | mov                 eax, dword ptr [esp + 0x58]

        $sequence_1 = { e8???????? 4885c0 7509 488d058fc70000 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   4885c0               | lea                 edx, [esp + 0x190]
            //   7509                 | inc                 ebp
            //   488d058fc70000       | xor                 ecx, ecx

        $sequence_2 = { 85db 0f45d8 ff15???????? 85db 488b9c2420050000 7567 488d9424f0000000 }
            // n = 7, score = 100
            //   85db                 | inc                 ecx
            //   0f45d8               | mov                 eax, 0xff
            //   ff15????????         |                     
            //   85db                 | nop                 word ptr [eax + eax]
            //   488b9c2420050000     | movzx               eax, byte ptr [edx + ecx]
            //   7567                 | xor                 al, 0x2e
            //   488d9424f0000000     | xor                 ax, cx

        $sequence_3 = { e8???????? 33db 48391d???????? 488bf8 0f85d5000000 488d0ddba20000 ff15???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   33db                 | dec                 eax
            //   48391d????????       |                     
            //   488bf8               | mov                 ecx, dword ptr [ecx + eax*8]
            //   0f85d5000000         | inc                 esp
            //   488d0ddba20000       | mov                 dword ptr [esp + 0x44], edi
            //   ff15????????         |                     

        $sequence_4 = { e8???????? 4883c448 c3 4c8b05???????? 32c9 33d2 6666666666660f1f840000000000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   4883c448             | mov                 ecx, dword ptr [ecx + eax*8]
            //   c3                   | inc                 esp
            //   4c8b05????????       |                     
            //   32c9                 | mov                 dword ptr [esp + 0x44], edi
            //   33d2                 | dec                 esp
            //   6666666666660f1f840000000000     | mov    edi, dword ptr [esp + 0x60]

        $sequence_5 = { 7528 48833d????????00 741e 488d0dc5a80000 e8???????? }
            // n = 5, score = 100
            //   7528                 | dec                 eax
            //   48833d????????00     |                     
            //   741e                 | add                 eax, 0x14
            //   488d0dc5a80000       | mov                 dword ptr [eax], ebx
            //   e8????????           |                     

        $sequence_6 = { 0fb6040a 3438 6633c1 48ffc1 664123c0 6689844cee000000 }
            // n = 6, score = 100
            //   0fb6040a             | mov                 ecx, esi
            //   3438                 | dec                 eax
            //   6633c1               | mov                 ecx, eax
            //   48ffc1               | dec                 eax
            //   664123c0             | lea                 edx, [0xa280]
            //   6689844cee000000     | dec                 eax

        $sequence_7 = { 488d152dc00000 ffc7 4a8b0ce2 4188440f4c 4a8b04e2 }
            // n = 5, score = 100
            //   488d152dc00000       | and                 eax, eax
            //   ffc7                 | movzx               edx, cl
            //   4a8b0ce2             | dec                 eax
            //   4188440f4c           | cmp                 edx, 0xf
            //   4a8b04e2             | jb                  0x20d

        $sequence_8 = { 4803c9 488b0cc8 48ff25???????? 4053 55 }
            // n = 5, score = 100
            //   4803c9               | dec                 eax
            //   488b0cc8             | lea                 edx, [esp + 0x20]
            //   48ff25????????       |                     
            //   4053                 | dec                 ecx
            //   55                   | mov                 ecx, ebx

        $sequence_9 = { 488d0df5130000 ff15???????? 8905???????? 83f8ff 7448 bac8020000 }
            // n = 6, score = 100
            //   488d0df5130000       | lea                 edx, [0x707f]
            //   ff15????????         |                     
            //   8905????????         |                     
            //   83f8ff               | jne                 0xc7
            //   7448                 | dec                 eax
            //   bac8020000           | lea                 eax, [0xab53]

    condition:
        7 of them and filesize < 172032
}