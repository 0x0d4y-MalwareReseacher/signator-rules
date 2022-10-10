rule win_mewsei_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.mewsei."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mewsei"
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
        $sequence_0 = { 895dec 335dfc 035de4 8dbc3b0c38e5fd 8b5dec c1cf09 037df8 }
            // n = 7, score = 400
            //   895dec               | mov                 dword ptr [ebp - 0x14], ebx
            //   335dfc               | xor                 ebx, dword ptr [ebp - 4]
            //   035de4               | add                 ebx, dword ptr [ebp - 0x1c]
            //   8dbc3b0c38e5fd       | lea                 edi, [ebx + edi - 0x21ac7f4]
            //   8b5dec               | mov                 ebx, dword ptr [ebp - 0x14]
            //   c1cf09               | ror                 edi, 9
            //   037df8               | add                 edi, dword ptr [ebp - 8]

        $sequence_1 = { 52 e8???????? 015d08 6a40 }
            // n = 4, score = 400
            //   52                   | push                edx
            //   e8????????           |                     
            //   015d08               | add                 dword ptr [ebp + 8], ebx
            //   6a40                 | push                0x40

        $sequence_2 = { 8bf8 e8???????? 83c404 8bf7 }
            // n = 4, score = 400
            //   8bf8                 | mov                 edi, eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8bf7                 | mov                 esi, edi

        $sequence_3 = { 0fb65830 c1e708 0bfb 89b988000000 }
            // n = 4, score = 400
            //   0fb65830             | movzx               ebx, byte ptr [eax + 0x30]
            //   c1e708               | shl                 edi, 8
            //   0bfb                 | or                  edi, ebx
            //   89b988000000         | mov                 dword ptr [ecx + 0x88], edi

        $sequence_4 = { c0e304 0ad8 8b45fc 881c01 41 890a 8bda }
            // n = 7, score = 400
            //   c0e304               | shl                 bl, 4
            //   0ad8                 | or                  bl, al
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   881c01               | mov                 byte ptr [ecx + eax], bl
            //   41                   | inc                 ecx
            //   890a                 | mov                 dword ptr [edx], ecx
            //   8bda                 | mov                 ebx, edx

        $sequence_5 = { 337dfc 8b5df8 237df0 337df4 037de4 }
            // n = 5, score = 400
            //   337dfc               | xor                 edi, dword ptr [ebp - 4]
            //   8b5df8               | mov                 ebx, dword ptr [ebp - 8]
            //   237df0               | and                 edi, dword ptr [ebp - 0x10]
            //   337df4               | xor                 edi, dword ptr [ebp - 0xc]
            //   037de4               | add                 edi, dword ptr [ebp - 0x1c]

        $sequence_6 = { 41 84d2 75f9 2bce 8d5c0108 8d4900 53 }
            // n = 7, score = 400
            //   41                   | inc                 ecx
            //   84d2                 | test                dl, dl
            //   75f9                 | jne                 0xfffffffb
            //   2bce                 | sub                 ecx, esi
            //   8d5c0108             | lea                 ebx, [ecx + eax + 8]
            //   8d4900               | lea                 ecx, [ecx]
            //   53                   | push                ebx

        $sequence_7 = { 741a 53 57 ff15???????? 85c0 }
            // n = 5, score = 400
            //   741a                 | je                  0x1c
            //   53                   | push                ebx
            //   57                   | push                edi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_8 = { 85c0 740e 6aff 50 ff15???????? a1???????? 8b35???????? }
            // n = 7, score = 400
            //   85c0                 | test                eax, eax
            //   740e                 | je                  0x10
            //   6aff                 | push                -1
            //   50                   | push                eax
            //   ff15????????         |                     
            //   a1????????           |                     
            //   8b35????????         |                     

        $sequence_9 = { 88540fff 3bc8 72d3 c6040700 8bc7 5f 5e }
            // n = 7, score = 400
            //   88540fff             | mov                 byte ptr [edi + ecx - 1], dl
            //   3bc8                 | cmp                 ecx, eax
            //   72d3                 | jb                  0xffffffd5
            //   c6040700             | mov                 byte ptr [edi + eax], 0
            //   8bc7                 | mov                 eax, edi
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

    condition:
        7 of them and filesize < 504832
}