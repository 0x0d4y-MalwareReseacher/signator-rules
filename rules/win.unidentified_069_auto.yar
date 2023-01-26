rule win_unidentified_069_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.unidentified_069."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_069"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { 8bf0 8975e0 e8???????? 84c0 0f8492010000 33db 8bc6 }
            // n = 7, score = 100
            //   8bf0                 | mov                 esi, eax
            //   8975e0               | mov                 dword ptr [ebp - 0x20], esi
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   0f8492010000         | je                  0x198
            //   33db                 | xor                 ebx, ebx
            //   8bc6                 | mov                 eax, esi

        $sequence_1 = { 8bf8 e8???????? 8bf0 8b450c 03f6 8930 8d842410010000 }
            // n = 7, score = 100
            //   8bf8                 | mov                 edi, eax
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   03f6                 | add                 esi, esi
            //   8930                 | mov                 dword ptr [eax], esi
            //   8d842410010000       | lea                 eax, [esp + 0x110]

        $sequence_2 = { 57 68???????? bb???????? 53 33ed ffd6 8b3d???????? }
            // n = 7, score = 100
            //   57                   | push                edi
            //   68????????           |                     
            //   bb????????           |                     
            //   53                   | push                ebx
            //   33ed                 | xor                 ebp, ebp
            //   ffd6                 | call                esi
            //   8b3d????????         |                     

        $sequence_3 = { 7405 ff4634 eb32 8d75d0 e8???????? 8b7508 }
            // n = 6, score = 100
            //   7405                 | je                  7
            //   ff4634               | inc                 dword ptr [esi + 0x34]
            //   eb32                 | jmp                 0x34
            //   8d75d0               | lea                 esi, [ebp - 0x30]
            //   e8????????           |                     
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]

        $sequence_4 = { 6aff 8bc7 50 ff7508 ffd6 6a24 }
            // n = 6, score = 100
            //   6aff                 | push                -1
            //   8bc7                 | mov                 eax, edi
            //   50                   | push                eax
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ffd6                 | call                esi
            //   6a24                 | push                0x24

        $sequence_5 = { 68???????? b812939384 e8???????? b001 8be5 5d c20400 }
            // n = 7, score = 100
            //   68????????           |                     
            //   b812939384           | mov                 eax, 0x84939312
            //   e8????????           |                     
            //   b001                 | mov                 al, 1
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c20400               | ret                 4

        $sequence_6 = { 85ff 0f84a1000000 803f00 0f8498000000 8b5c0108 85db 0f848c000000 }
            // n = 7, score = 100
            //   85ff                 | test                edi, edi
            //   0f84a1000000         | je                  0xa7
            //   803f00               | cmp                 byte ptr [edi], 0
            //   0f8498000000         | je                  0x9e
            //   8b5c0108             | mov                 ebx, dword ptr [ecx + eax + 8]
            //   85db                 | test                ebx, ebx
            //   0f848c000000         | je                  0x92

        $sequence_7 = { 53 56 57 8bf8 8d7708 }
            // n = 5, score = 100
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8bf8                 | mov                 edi, eax
            //   8d7708               | lea                 esi, [edi + 8]

        $sequence_8 = { 8b08 50 ff5108 8b75ec 8b06 56 ff5008 }
            // n = 7, score = 100
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   50                   | push                eax
            //   ff5108               | call                dword ptr [ecx + 8]
            //   8b75ec               | mov                 esi, dword ptr [ebp - 0x14]
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   56                   | push                esi
            //   ff5008               | call                dword ptr [eax + 8]

        $sequence_9 = { 668906 8d45fc 50 8d85ecf7ffff 50 33ff 57 }
            // n = 7, score = 100
            //   668906               | mov                 word ptr [esi], ax
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   8d85ecf7ffff         | lea                 eax, [ebp - 0x814]
            //   50                   | push                eax
            //   33ff                 | xor                 edi, edi
            //   57                   | push                edi

    condition:
        7 of them and filesize < 434176
}