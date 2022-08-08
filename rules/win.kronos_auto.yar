rule win_kronos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.kronos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kronos"
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
        $sequence_0 = { 894814 897804 8930 ff461c 6a00 ff15???????? 85c0 }
            // n = 7, score = 2800
            //   894814               | mov                 dword ptr [eax + 0x14], ecx
            //   897804               | mov                 dword ptr [eax + 4], edi
            //   8930                 | mov                 dword ptr [eax], esi
            //   ff461c               | inc                 dword ptr [esi + 0x1c]
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_1 = { 8d45ec 50 ff15???????? 894508 3bfb }
            // n = 5, score = 2800
            //   8d45ec               | lea                 eax, [ebp - 0x14]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   894508               | mov                 dword ptr [ebp + 8], eax
            //   3bfb                 | cmp                 edi, ebx

        $sequence_2 = { 8d55f4 52 ffd0 833801 8b4804 8b5008 8955f0 }
            // n = 7, score = 2800
            //   8d55f4               | lea                 edx, [ebp - 0xc]
            //   52                   | push                edx
            //   ffd0                 | call                eax
            //   833801               | cmp                 dword ptr [eax], 1
            //   8b4804               | mov                 ecx, dword ptr [eax + 4]
            //   8b5008               | mov                 edx, dword ptr [eax + 8]
            //   8955f0               | mov                 dword ptr [ebp - 0x10], edx

        $sequence_3 = { 03c8 51 e8???????? 8b45e4 83c424 50 57 }
            // n = 7, score = 2800
            //   03c8                 | add                 ecx, eax
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]
            //   83c424               | add                 esp, 0x24
            //   50                   | push                eax
            //   57                   | push                edi

        $sequence_4 = { 8b4804 8b5008 8955f0 894d0c }
            // n = 4, score = 2800
            //   8b4804               | mov                 ecx, dword ptr [eax + 4]
            //   8b5008               | mov                 edx, dword ptr [eax + 8]
            //   8955f0               | mov                 dword ptr [ebp - 0x10], edx
            //   894d0c               | mov                 dword ptr [ebp + 0xc], ecx

        $sequence_5 = { 7515 8d4801 8a11 84d2 740c 80fa5c 7407 }
            // n = 7, score = 2800
            //   7515                 | jne                 0x17
            //   8d4801               | lea                 ecx, [eax + 1]
            //   8a11                 | mov                 dl, byte ptr [ecx]
            //   84d2                 | test                dl, dl
            //   740c                 | je                  0xe
            //   80fa5c               | cmp                 dl, 0x5c
            //   7407                 | je                  9

        $sequence_6 = { 895010 5f 8930 897004 897008 89700c 897020 }
            // n = 7, score = 2800
            //   895010               | mov                 dword ptr [eax + 0x10], edx
            //   5f                   | pop                 edi
            //   8930                 | mov                 dword ptr [eax], esi
            //   897004               | mov                 dword ptr [eax + 4], esi
            //   897008               | mov                 dword ptr [eax + 8], esi
            //   89700c               | mov                 dword ptr [eax + 0xc], esi
            //   897020               | mov                 dword ptr [eax + 0x20], esi

        $sequence_7 = { 8b45ec 57 50 ff15???????? 0fb7c8 51 }
            // n = 6, score = 2800
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   57                   | push                edi
            //   50                   | push                eax
            //   ff15????????         |                     
            //   0fb7c8               | movzx               ecx, ax
            //   51                   | push                ecx

        $sequence_8 = { 40 84c9 75f9 2bc2 83c608 8bce 8bf8 }
            // n = 7, score = 2800
            //   40                   | inc                 eax
            //   84c9                 | test                cl, cl
            //   75f9                 | jne                 0xfffffffb
            //   2bc2                 | sub                 eax, edx
            //   83c608               | add                 esi, 8
            //   8bce                 | mov                 ecx, esi
            //   8bf8                 | mov                 edi, eax

        $sequence_9 = { 85c9 740a 85ff 7406 8b4924 }
            // n = 5, score = 2800
            //   85c9                 | test                ecx, ecx
            //   740a                 | je                  0xc
            //   85ff                 | test                edi, edi
            //   7406                 | je                  8
            //   8b4924               | mov                 ecx, dword ptr [ecx + 0x24]

    condition:
        7 of them and filesize < 1302528
}