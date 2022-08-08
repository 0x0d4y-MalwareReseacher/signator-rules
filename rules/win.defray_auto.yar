rule win_defray_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.defray."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.defray"
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
        $sequence_0 = { 50 e8???????? 8b85c4f0ffff 898590f0ffff 85c0 0f8488010000 }
            // n = 6, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b85c4f0ffff         | mov                 eax, dword ptr [ebp - 0xf3c]
            //   898590f0ffff         | mov                 dword ptr [ebp - 0xf70], eax
            //   85c0                 | test                eax, eax
            //   0f8488010000         | je                  0x18e

        $sequence_1 = { 8b45f4 8b00 2bc2 8d5601 3bc2 0f4cd0 8955ec }
            // n = 7, score = 200
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   2bc2                 | sub                 eax, edx
            //   8d5601               | lea                 edx, [esi + 1]
            //   3bc2                 | cmp                 eax, edx
            //   0f4cd0               | cmovl               edx, eax
            //   8955ec               | mov                 dword ptr [ebp - 0x14], edx

        $sequence_2 = { e9???????? c745dc02000000 c745e03c634700 8b4508 8bcf 8b7510 dd00 }
            // n = 7, score = 200
            //   e9????????           |                     
            //   c745dc02000000       | mov                 dword ptr [ebp - 0x24], 2
            //   c745e03c634700       | mov                 dword ptr [ebp - 0x20], 0x47633c
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8bcf                 | mov                 ecx, edi
            //   8b7510               | mov                 esi, dword ptr [ebp + 0x10]
            //   dd00                 | fld                 qword ptr [eax]

        $sequence_3 = { a3???????? a3???????? a3???????? 5f 5b 5e c3 }
            // n = 7, score = 200
            //   a3????????           |                     
            //   a3????????           |                     
            //   a3????????           |                     
            //   5f                   | pop                 edi
            //   5b                   | pop                 ebx
            //   5e                   | pop                 esi
            //   c3                   | ret                 

        $sequence_4 = { c1f803 50 ff37 e8???????? 83c40c 8d04f3 891f }
            // n = 7, score = 200
            //   c1f803               | sar                 eax, 3
            //   50                   | push                eax
            //   ff37                 | push                dword ptr [edi]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d04f3               | lea                 eax, [ebx + esi*8]
            //   891f                 | mov                 dword ptr [edi], ebx

        $sequence_5 = { 8b5518 3bc1 0f44d7 8b45fc 8910 e9???????? 8b5518 }
            // n = 7, score = 200
            //   8b5518               | mov                 edx, dword ptr [ebp + 0x18]
            //   3bc1                 | cmp                 eax, ecx
            //   0f44d7               | cmove               edx, edi
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8910                 | mov                 dword ptr [eax], edx
            //   e9????????           |                     
            //   8b5518               | mov                 edx, dword ptr [ebp + 0x18]

        $sequence_6 = { 8b35???????? 85f6 7420 6bc618 57 8db840f04800 57 }
            // n = 7, score = 200
            //   8b35????????         |                     
            //   85f6                 | test                esi, esi
            //   7420                 | je                  0x22
            //   6bc618               | imul                eax, esi, 0x18
            //   57                   | push                edi
            //   8db840f04800         | lea                 edi, [eax + 0x48f040]
            //   57                   | push                edi

        $sequence_7 = { e8???????? 83c608 83ef01 75f1 8b750c }
            // n = 5, score = 200
            //   e8????????           |                     
            //   83c608               | add                 esi, 8
            //   83ef01               | sub                 edi, 1
            //   75f1                 | jne                 0xfffffff3
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]

        $sequence_8 = { 7420 8939 897904 897908 8b46f8 8901 }
            // n = 6, score = 200
            //   7420                 | je                  0x22
            //   8939                 | mov                 dword ptr [ecx], edi
            //   897904               | mov                 dword ptr [ecx + 4], edi
            //   897908               | mov                 dword ptr [ecx + 8], edi
            //   8b46f8               | mov                 eax, dword ptr [esi - 8]
            //   8901                 | mov                 dword ptr [ecx], eax

        $sequence_9 = { 50 56 ff15???????? 85c0 7579 ff15???????? 50 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7579                 | jne                 0x7b
            //   ff15????????         |                     
            //   50                   | push                eax

    condition:
        7 of them and filesize < 1253376
}