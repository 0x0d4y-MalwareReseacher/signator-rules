rule win_pillowmint_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.pillowmint."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pillowmint"
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
        $sequence_0 = { e8???????? 48833d????????00 753f e8???????? 803800 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   48833d????????00     |                     
            //   753f                 | lea                 ecx, [0x276fe]
            //   e8????????           |                     
            //   803800               | jne                 0xbdd

        $sequence_1 = { 750d 488d0db77e0300 e8???????? cc 4c8b5318 4983fa10 7205 }
            // n = 7, score = 100
            //   750d                 | dec                 eax
            //   488d0db77e0300       | mov                 dword ptr [ebp + 0xd0], ebx
            //   e8????????           |                     
            //   cc                   | mov                 byte ptr [ebp + 0xc0], 0
            //   4c8b5318             | dec                 ecx
            //   4983fa10             | or                  ecx, 0xffffffff
            //   7205                 | inc                 ebp

        $sequence_2 = { ff15???????? 4883cfff 488bc7 0f1f440000 807c030100 488d4001 75f5 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   4883cfff             | dec                 eax
            //   488bc7               | lea                 ebx, [eax + 1]
            //   0f1f440000           | jmp                 0x1297
            //   807c030100           | dec                 eax
            //   488d4001             | lea                 eax, [ebp - 9]
            //   75f5                 | dec                 eax

        $sequence_3 = { 4c8b742438 488b5c2430 48894608 488b6c2440 488b742448 4883c420 5f }
            // n = 7, score = 100
            //   4c8b742438           | inc                 esp
            //   488b5c2430           | mov                 dword ptr [esp + 0x40], esi
            //   48894608             | dec                 eax
            //   488b6c2440           | mov                 esi, edx
            //   488b742448           | mov                 ebp, eax
            //   4883c420             | test                eax, eax
            //   5f                   | inc                 ebp

        $sequence_4 = { 02cb 41884901 41c6410220 41f76a14 c1fa05 418bc3 448bc2 }
            // n = 7, score = 100
            //   02cb                 | inc                 ecx
            //   41884901             | dec                 ebp
            //   41c6410220           | lea                 esi, [esi + 1]
            //   41f76a14             | inc                 esp
            //   c1fa05               | movzx               esp, byte ptr [esp + 0x82]
            //   418bc3               | movzx               ebp, byte ptr [esp + 0x81]
            //   448bc2               | inc                 esp

        $sequence_5 = { 488bc3 488bfb 48c1ff05 4c8d25bc660200 83e01f 4c6bf858 }
            // n = 6, score = 100
            //   488bc3               | inc                 ecx
            //   488bfb               | mov                 byte ptr [eax + 0xc], cl
            //   48c1ff05             | inc                 ecx
            //   4c8d25bc660200       | mov                 byte ptr [eax + 0xd], 0x3a
            //   83e01f               | add                 al, al
            //   4c6bf858             | sub                 cl, al

        $sequence_6 = { 33db 0f1f4000 488d0d710d0300 48833d????????10 480f430d???????? 0fb6841c88000000 }
            // n = 6, score = 100
            //   33db                 | dec                 eax
            //   0f1f4000             | dec                 ecx
            //   488d0d710d0300       | dec                 esp
            //   48833d????????10     |                     
            //   480f430d????????     |                     
            //   0fb6841c88000000     | add                 eax, ecx

        $sequence_7 = { c60300 4883c320 483bdf 75d5 498bcd e8???????? 90 }
            // n = 7, score = 100
            //   c60300               | mov                 edi, dword ptr [ecx]
            //   4883c320             | inc                 ebp
            //   483bdf               | mov                 ebx, dword ptr [eax + 0x20]
            //   75d5                 | inc                 esp
            //   498bcd               | cmp                 ebx, edi
            //   e8????????           |                     
            //   90                   | dec                 eax

        $sequence_8 = { e8???????? 4883bdc801000000 7458 488d9580000000 488d8d30010000 e8???????? 488bc8 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   4883bdc801000000     | je                  0x15ed
            //   7458                 | mov                 edi, 0xd
            //   488d9580000000       | mov                 ecx, edi
            //   488d8d30010000       | dec                 eax
            //   e8????????           |                     
            //   488bc8               | lea                 eax, [0x23b3d]

        $sequence_9 = { e8???????? 803800 7505 4d8bc6 eb0e 4983c8ff 49ffc0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   803800               | lea                 edx, [0x19703]
            //   7505                 | dec                 eax
            //   4d8bc6               | lea                 edx, [0x28e17]
            //   eb0e                 | dec                 eax
            //   4983c8ff             | lea                 ecx, [ebp + 0x80]
            //   49ffc0               | nop                 

    condition:
        7 of them and filesize < 4667392
}