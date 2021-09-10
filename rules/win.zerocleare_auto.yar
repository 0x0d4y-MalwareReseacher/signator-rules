rule win_zerocleare_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.zerocleare."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.zerocleare"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 894dd8 85c9 0f8ea2000000 8b45d0 0fb644022e 0fbe8010d84400 40 }
            // n = 7, score = 100
            //   894dd8               | mov                 dword ptr [ebp - 0x28], ecx
            //   85c9                 | test                ecx, ecx
            //   0f8ea2000000         | jle                 0xa8
            //   8b45d0               | mov                 eax, dword ptr [ebp - 0x30]
            //   0fb644022e           | movzx               eax, byte ptr [edx + eax + 0x2e]
            //   0fbe8010d84400       | movsx               eax, byte ptr [eax + 0x44d810]
            //   40                   | inc                 eax

        $sequence_1 = { 33c0 40 e9???????? 8365c800 c745cc549e4000 a1???????? }
            // n = 6, score = 100
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax
            //   e9????????           |                     
            //   8365c800             | and                 dword ptr [ebp - 0x38], 0
            //   c745cc549e4000       | mov                 dword ptr [ebp - 0x34], 0x409e54
            //   a1????????           |                     

        $sequence_2 = { 8b048540fd4400 894df0 8a440129 8b4d08 8845fc }
            // n = 5, score = 100
            //   8b048540fd4400       | mov                 eax, dword ptr [eax*4 + 0x44fd40]
            //   894df0               | mov                 dword ptr [ebp - 0x10], ecx
            //   8a440129             | mov                 al, byte ptr [ecx + eax + 0x29]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8845fc               | mov                 byte ptr [ebp - 4], al

        $sequence_3 = { 8bce 2bcf f7e9 8b0d???????? }
            // n = 4, score = 100
            //   8bce                 | mov                 ecx, esi
            //   2bcf                 | sub                 ecx, edi
            //   f7e9                 | imul                ecx
            //   8b0d????????         |                     

        $sequence_4 = { 8bd9 8945f4 56 8b7508 57 8b13 }
            // n = 6, score = 100
            //   8bd9                 | mov                 ebx, ecx
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   57                   | push                edi
            //   8b13                 | mov                 edx, dword ptr [ebx]

        $sequence_5 = { c745b000000000 c645b400 33c0 c745b800000000 }
            // n = 4, score = 100
            //   c745b000000000       | mov                 dword ptr [ebp - 0x50], 0
            //   c645b400             | mov                 byte ptr [ebp - 0x4c], 0
            //   33c0                 | xor                 eax, eax
            //   c745b800000000       | mov                 dword ptr [ebp - 0x48], 0

        $sequence_6 = { 8b04f554ac4300 5f 5e 5b }
            // n = 4, score = 100
            //   8b04f554ac4300       | mov                 eax, dword ptr [esi*8 + 0x43ac54]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_7 = { 8b4c2404 81ec0c080000 8d0424 50 51 e8???????? }
            // n = 6, score = 100
            //   8b4c2404             | mov                 ecx, dword ptr [esp + 4]
            //   81ec0c080000         | sub                 esp, 0x80c
            //   8d0424               | lea                 eax, dword ptr [esp]
            //   50                   | push                eax
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_8 = { e8???????? e9???????? 8b7df8 8b550c 894df4 8955ec 8b04bd40fd4400 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   e9????????           |                     
            //   8b7df8               | mov                 edi, dword ptr [ebp - 8]
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx
            //   8955ec               | mov                 dword ptr [ebp - 0x14], edx
            //   8b04bd40fd4400       | mov                 eax, dword ptr [edi*4 + 0x44fd40]

        $sequence_9 = { 0f94c1 fec9 8b148540fd4400 80e102 8a44172d 24fd 0ac8 }
            // n = 7, score = 100
            //   0f94c1               | sete                cl
            //   fec9                 | dec                 cl
            //   8b148540fd4400       | mov                 edx, dword ptr [eax*4 + 0x44fd40]
            //   80e102               | and                 cl, 2
            //   8a44172d             | mov                 al, byte ptr [edi + edx + 0x2d]
            //   24fd                 | and                 al, 0xfd
            //   0ac8                 | or                  cl, al

    condition:
        7 of them and filesize < 42670080
}