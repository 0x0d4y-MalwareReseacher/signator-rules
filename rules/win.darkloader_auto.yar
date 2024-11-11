rule win_darkloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.darkloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.darkloader"
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
        $sequence_0 = { a5 a5 a5 a4 33f6 85ed }
            // n = 6, score = 100
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a4                   | movsb               byte ptr es:[edi], byte ptr [esi]
            //   33f6                 | xor                 esi, esi
            //   85ed                 | test                ebp, ebp

        $sequence_1 = { 8b4c2410 c6040b25 0fb6043e c1e804 8a440414 }
            // n = 5, score = 100
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]
            //   c6040b25             | mov                 byte ptr [ebx + ecx], 0x25
            //   0fb6043e             | movzx               eax, byte ptr [esi + edi]
            //   c1e804               | shr                 eax, 4
            //   8a440414             | mov                 al, byte ptr [esp + eax + 0x14]

        $sequence_2 = { 2bce 741d 803c3a5c 7504 }
            // n = 4, score = 100
            //   2bce                 | sub                 ecx, esi
            //   741d                 | je                  0x1f
            //   803c3a5c             | cmp                 byte ptr [edx + edi], 0x5c
            //   7504                 | jne                 6

        $sequence_3 = { 880416 42 3b5510 7cf4 5e 5d }
            // n = 6, score = 100
            //   880416               | mov                 byte ptr [esi + edx], al
            //   42                   | inc                 edx
            //   3b5510               | cmp                 edx, dword ptr [ebp + 0x10]
            //   7cf4                 | jl                  0xfffffff6
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp

        $sequence_4 = { 50 ff15???????? 56 ff15???????? 8b35???????? 8d4508 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8b35????????         |                     
            //   8d4508               | lea                 eax, [ebp + 8]

        $sequence_5 = { 68???????? eb38 8d042f 50 e8???????? }
            // n = 5, score = 100
            //   68????????           |                     
            //   eb38                 | jmp                 0x3a
            //   8d042f               | lea                 eax, [edi + ebp]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_6 = { 88040a 41 84c0 75f6 ff742410 46 83ef80 }
            // n = 7, score = 100
            //   88040a               | mov                 byte ptr [edx + ecx], al
            //   41                   | inc                 ecx
            //   84c0                 | test                al, al
            //   75f6                 | jne                 0xfffffff8
            //   ff742410             | push                dword ptr [esp + 0x10]
            //   46                   | inc                 esi
            //   83ef80               | sub                 edi, -0x80

        $sequence_7 = { 8b442418 8b7c2414 ff7024 55 }
            // n = 4, score = 100
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   8b7c2414             | mov                 edi, dword ptr [esp + 0x14]
            //   ff7024               | push                dword ptr [eax + 0x24]
            //   55                   | push                ebp

        $sequence_8 = { 46 3bf5 7c8e 5f }
            // n = 4, score = 100
            //   46                   | inc                 esi
            //   3bf5                 | cmp                 esi, ebp
            //   7c8e                 | jl                  0xffffff90
            //   5f                   | pop                 edi

        $sequence_9 = { a3???????? 5e c3 55 8bec 81ec04040000 33c9 }
            // n = 7, score = 100
            //   a3????????           |                     
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec04040000         | sub                 esp, 0x404
            //   33c9                 | xor                 ecx, ecx

    condition:
        7 of them and filesize < 124928
}