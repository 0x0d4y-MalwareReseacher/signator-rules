rule win_client_maximus_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.client_maximus."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.client_maximus"
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
        $sequence_0 = { 890424 8954240c ff5320 ff15???????? 895c2408 }
            // n = 5, score = 300
            //   890424               | mov                 dword ptr [esp], eax
            //   8954240c             | mov                 dword ptr [esp + 0xc], edx
            //   ff5320               | call                dword ptr [ebx + 0x20]
            //   ff15????????         |                     
            //   895c2408             | mov                 dword ptr [esp + 8], ebx

        $sequence_1 = { c70424???????? ff15???????? 83ec04 a3???????? c7442404???????? 893424 ff15???????? }
            // n = 7, score = 300
            //   c70424????????       |                     
            //   ff15????????         |                     
            //   83ec04               | sub                 esp, 4
            //   a3????????           |                     
            //   c7442404????????     |                     
            //   893424               | mov                 dword ptr [esp], esi
            //   ff15????????         |                     

        $sequence_2 = { c704247e000000 ff15???????? 83ec04 e9???????? }
            // n = 4, score = 300
            //   c704247e000000       | mov                 dword ptr [esp], 0x7e
            //   ff15????????         |                     
            //   83ec04               | sub                 esp, 4
            //   e9????????           |                     

        $sequence_3 = { c744240800800000 c744240400000000 890424 8954240c ff5320 }
            // n = 5, score = 300
            //   c744240800800000     | mov                 dword ptr [esp + 8], 0x8000
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   890424               | mov                 dword ptr [esp], eax
            //   8954240c             | mov                 dword ptr [esp + 0xc], edx
            //   ff5320               | call                dword ptr [ebx + 0x20]

        $sequence_4 = { 89542404 ff532c 8b5308 83c601 39730c 7fe1 891424 }
            // n = 7, score = 300
            //   89542404             | mov                 dword ptr [esp + 4], edx
            //   ff532c               | call                dword ptr [ebx + 0x2c]
            //   8b5308               | mov                 edx, dword ptr [ebx + 8]
            //   83c601               | add                 esi, 1
            //   39730c               | cmp                 dword ptr [ebx + 0xc], esi
            //   7fe1                 | jg                  0xffffffe3
            //   891424               | mov                 dword ptr [esp], edx

        $sequence_5 = { 881403 75d1 5b 5e 5f }
            // n = 5, score = 300
            //   881403               | mov                 byte ptr [ebx + eax], dl
            //   75d1                 | jne                 0xffffffd3
            //   5b                   | pop                 ebx
            //   5e                   | pop                 esi
            //   5f                   | pop                 edi

        $sequence_6 = { ff5320 ff15???????? 895c2408 c744240400000000 890424 ff15???????? 83ec0c }
            // n = 7, score = 300
            //   ff5320               | call                dword ptr [ebx + 0x20]
            //   ff15????????         |                     
            //   895c2408             | mov                 dword ptr [esp + 8], ebx
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   890424               | mov                 dword ptr [esp], eax
            //   ff15????????         |                     
            //   83ec0c               | sub                 esp, 0xc

        $sequence_7 = { 8b4628 85c0 7535 c70424???????? }
            // n = 4, score = 300
            //   8b4628               | mov                 eax, dword ptr [esi + 0x28]
            //   85c0                 | test                eax, eax
            //   7535                 | jne                 0x37
            //   c70424????????       |                     

        $sequence_8 = { 893424 ff15???????? 83ec08 85c0 7411 }
            // n = 5, score = 300
            //   893424               | mov                 dword ptr [esp], esi
            //   ff15????????         |                     
            //   83ec08               | sub                 esp, 8
            //   85c0                 | test                eax, eax
            //   7411                 | je                  0x13

        $sequence_9 = { 01c6 89f0 0fb6c0 0fb61403 88140b 83c101 }
            // n = 6, score = 300
            //   01c6                 | add                 esi, eax
            //   89f0                 | mov                 eax, esi
            //   0fb6c0               | movzx               eax, al
            //   0fb61403             | movzx               edx, byte ptr [ebx + eax]
            //   88140b               | mov                 byte ptr [ebx + ecx], dl
            //   83c101               | add                 ecx, 1

    condition:
        7 of them and filesize < 106496
}