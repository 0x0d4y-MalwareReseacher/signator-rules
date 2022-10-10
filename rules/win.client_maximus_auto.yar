rule win_client_maximus_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.client_maximus."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.client_maximus"
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
        $sequence_0 = { 8b4628 85c0 7535 c70424???????? }
            // n = 4, score = 300
            //   8b4628               | mov                 eax, dword ptr [esi + 0x28]
            //   85c0                 | test                eax, eax
            //   7535                 | jne                 0x37
            //   c70424????????       |                     

        $sequence_1 = { 7409 c70424???????? ffd2 8d65f8 5b 5e }
            // n = 6, score = 300
            //   7409                 | je                  0xb
            //   c70424????????       |                     
            //   ffd2                 | call                edx
            //   8d65f8               | lea                 esp, [ebp - 8]
            //   5b                   | pop                 ebx
            //   5e                   | pop                 esi

        $sequence_2 = { 85c0 7438 c70424???????? ffd3 }
            // n = 4, score = 300
            //   85c0                 | test                eax, eax
            //   7438                 | je                  0x3a
            //   c70424????????       |                     
            //   ffd3                 | call                ebx

        $sequence_3 = { 0fb6c0 0fb61403 88140b 83c101 }
            // n = 4, score = 300
            //   0fb6c0               | movzx               eax, al
            //   0fb61403             | movzx               edx, byte ptr [ebx + eax]
            //   88140b               | mov                 byte ptr [ebx + ecx], dl
            //   83c101               | add                 ecx, 1

        $sequence_4 = { 83ec10 8b1d???????? c70424???????? ffd3 89c6 }
            // n = 5, score = 300
            //   83ec10               | sub                 esp, 0x10
            //   8b1d????????         |                     
            //   c70424????????       |                     
            //   ffd3                 | call                ebx
            //   89c6                 | mov                 esi, eax

        $sequence_5 = { 88140b 83c101 89fa 81f900010000 881403 75d1 5b }
            // n = 7, score = 300
            //   88140b               | mov                 byte ptr [ebx + ecx], dl
            //   83c101               | add                 ecx, 1
            //   89fa                 | mov                 edx, edi
            //   81f900010000         | cmp                 ecx, 0x100
            //   881403               | mov                 byte ptr [ebx + eax], dl
            //   75d1                 | jne                 0xffffffd3
            //   5b                   | pop                 ebx

        $sequence_6 = { 8b5330 890424 89542404 ff532c }
            // n = 4, score = 300
            //   8b5330               | mov                 edx, dword ptr [ebx + 0x30]
            //   890424               | mov                 dword ptr [esp], eax
            //   89542404             | mov                 dword ptr [esp + 4], edx
            //   ff532c               | call                dword ptr [ebx + 0x2c]

        $sequence_7 = { 7410 8b5330 890424 89542404 ff532c 8b5308 83c601 }
            // n = 7, score = 300
            //   7410                 | je                  0x12
            //   8b5330               | mov                 edx, dword ptr [ebx + 0x30]
            //   890424               | mov                 dword ptr [esp], eax
            //   89542404             | mov                 dword ptr [esp + 4], edx
            //   ff532c               | call                dword ptr [ebx + 0x2c]
            //   8b5308               | mov                 edx, dword ptr [ebx + 8]
            //   83c601               | add                 esi, 1

        $sequence_8 = { 5f 5d c3 8b4210 85c0 }
            // n = 5, score = 300
            //   5f                   | pop                 edi
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b4210               | mov                 eax, dword ptr [edx + 0x10]
            //   85c0                 | test                eax, eax

        $sequence_9 = { 5e 5f 5d c3 8b4210 85c0 }
            // n = 6, score = 300
            //   5e                   | pop                 esi
            //   5f                   | pop                 edi
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b4210               | mov                 eax, dword ptr [edx + 0x10]
            //   85c0                 | test                eax, eax

    condition:
        7 of them and filesize < 106496
}