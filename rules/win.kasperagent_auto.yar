rule win_kasperagent_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.kasperagent."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kasperagent"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 894c2430 894c2434 894c2438 894c243c 85c0 7463 dd07 }
            // n = 7, score = 200
            //   894c2430             | mov                 dword ptr [esp + 0x30], ecx
            //   894c2434             | mov                 dword ptr [esp + 0x34], ecx
            //   894c2438             | mov                 dword ptr [esp + 0x38], ecx
            //   894c243c             | mov                 dword ptr [esp + 0x3c], ecx
            //   85c0                 | test                eax, eax
            //   7463                 | je                  0x65
            //   dd07                 | fld                 qword ptr [edi]

        $sequence_1 = { 8b35???????? 8b4ef0 8b11 8b4210 83c6f0 }
            // n = 5, score = 200
            //   8b35????????         |                     
            //   8b4ef0               | mov                 ecx, dword ptr [esi - 0x10]
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   8b4210               | mov                 eax, dword ptr [edx + 0x10]
            //   83c6f0               | add                 esi, -0x10

        $sequence_2 = { 66890472 8b442414 5f 5e 5d 5b }
            // n = 6, score = 200
            //   66890472             | mov                 word ptr [edx + esi*2], ax
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx

        $sequence_3 = { 56 57 8bf9 85db 7470 8b2d???????? }
            // n = 6, score = 200
            //   56                   | push                esi
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   85db                 | test                ebx, ebx
            //   7470                 | je                  0x72
            //   8b2d????????         |                     

        $sequence_4 = { 33f6 5f 6689344a 5e 83c408 }
            // n = 5, score = 200
            //   33f6                 | xor                 esi, esi
            //   5f                   | pop                 edi
            //   6689344a             | mov                 word ptr [edx + ecx*2], si
            //   5e                   | pop                 esi
            //   83c408               | add                 esp, 8

        $sequence_5 = { 0fb74c2418 81c26c070000 40 668916 0fb754240c 66894602 668b442408 }
            // n = 7, score = 200
            //   0fb74c2418           | movzx               ecx, word ptr [esp + 0x18]
            //   81c26c070000         | add                 edx, 0x76c
            //   40                   | inc                 eax
            //   668916               | mov                 word ptr [esi], dx
            //   0fb754240c           | movzx               edx, word ptr [esp + 0xc]
            //   66894602             | mov                 word ptr [esi + 2], ax
            //   668b442408           | mov                 ax, word ptr [esp + 8]

        $sequence_6 = { c9 c20c00 8bff 55 8bec 817d0c10010000 }
            // n = 6, score = 200
            //   c9                   | leave               
            //   c20c00               | ret                 0xc
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   817d0c10010000       | cmp                 dword ptr [ebp + 0xc], 0x110

        $sequence_7 = { 8b4500 8b70f4 32db 3bf7 7e66 668b4c2418 }
            // n = 6, score = 200
            //   8b4500               | mov                 eax, dword ptr [ebp]
            //   8b70f4               | mov                 esi, dword ptr [eax - 0xc]
            //   32db                 | xor                 bl, bl
            //   3bf7                 | cmp                 esi, edi
            //   7e66                 | jle                 0x68
            //   668b4c2418           | mov                 cx, word ptr [esp + 0x18]

        $sequence_8 = { 668929 83c102 83c002 47 }
            // n = 4, score = 200
            //   668929               | mov                 word ptr [ecx], bp
            //   83c102               | add                 ecx, 2
            //   83c002               | add                 eax, 2
            //   47                   | inc                 edi

        $sequence_9 = { c645fc00 8b45cc 83c0f0 8d480c 8bd6 }
            // n = 5, score = 200
            //   c645fc00             | mov                 byte ptr [ebp - 4], 0
            //   8b45cc               | mov                 eax, dword ptr [ebp - 0x34]
            //   83c0f0               | add                 eax, -0x10
            //   8d480c               | lea                 ecx, [eax + 0xc]
            //   8bd6                 | mov                 edx, esi

    condition:
        7 of them and filesize < 1605632
}