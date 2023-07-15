rule win_iconic_stealer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.iconic_stealer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.iconic_stealer"
        malpedia_rule_date = "20230705"
        malpedia_hash = "42d0574f4405bd7d2b154d321d345acb18834a41"
        malpedia_version = "20230715"
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
        $sequence_0 = { e8???????? 488bd0 4885c0 7450 85db 7e32 488bc8 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   488bd0               | dec                 ecx
            //   4885c0               | mov                 ecx, dword ptr [edi + ebx*8]
            //   7450                 | dec                 eax
            //   85db                 | test                ecx, ecx
            //   7e32                 | inc                 ecx
            //   488bc8               | mov                 ebx, ebp

        $sequence_1 = { bab4000000 e8???????? 4c8bc0 e9???????? 4533c9 4533c0 bab4000000 }
            // n = 7, score = 100
            //   bab4000000           | mov                 dword ptr [esp + 0x38], eax
            //   e8????????           |                     
            //   4c8bc0               | mov                 edi, dword ptr [ecx + 0x30]
            //   e9????????           |                     
            //   4533c9               | inc                 esp
            //   4533c0               | mov                 esi, edx
            //   bab4000000           | inc                 ecx

        $sequence_2 = { 8bd7 488bcb e8???????? eb0d 488b4328 668363142d 48894308 }
            // n = 7, score = 100
            //   8bd7                 | cmp                 bh, 2
            //   488bcb               | jne                 0xd4b
            //   e8????????           |                     
            //   eb0d                 | dec                 eax
            //   488b4328             | mov                 eax, dword ptr [ebx]
            //   668363142d           | jmp                 0xd4e
            //   48894308             | dec                 esp

        $sequence_3 = { c744c80805000000 448944c80c 4c894cc810 488b03 8b9390000000 80786700 7409 }
            // n = 7, score = 100
            //   c744c80805000000     | mov                 dword ptr [esi + 2], eax
            //   448944c80c           | dec                 eax
            //   4c894cc810           | mov                 edx, dword ptr [esi + 0x68]
            //   488b03               | dec                 ecx
            //   8b9390000000         | mov                 dword ptr [esi + 0x68], eax
            //   80786700             | dec                 eax
            //   7409                 | lea                 edi, [esp + 0x80]

        $sequence_4 = { bf05000000 8bc7 488b8d60010000 4833cc e8???????? 4c8d9c2470020000 498b5b18 }
            // n = 7, score = 100
            //   bf05000000           | sub                 esp, 0x30
            //   8bc7                 | dec                 esp
            //   488b8d60010000       | mov                 ebp, dword ptr [ecx]
            //   4833cc               | dec                 esp
            //   e8????????           |                     
            //   4c8d9c2470020000     | mov                 esi, ecx
            //   498b5b18             | dec                 ebp

        $sequence_5 = { e8???????? 488bf8 4885c0 0f8411010000 0f57c0 33c0 0f1107 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   488bf8               | shl                 ecx, 8
            //   4885c0               | inc                 ecx
            //   0f8411010000         | mov                 esi, esp
            //   0f57c0               | inc                 ebp
            //   33c0                 | test                esi, esi
            //   0f1107               | je                  0xad4

        $sequence_6 = { c3 48f7da 781d 4d85c0 7e33 48b8ffffffffffffff7f 492bc0 }
            // n = 7, score = 100
            //   c3                   | dec                 esp
            //   48f7da               | mov                 esi, dword ptr [ebx + 0x38]
            //   781d                 | inc                 ecx
            //   4d85c0               | pop                 edi
            //   7e33                 | inc                 ecx
            //   48b8ffffffffffffff7f     | pop    esi
            //   492bc0               | inc                 ecx

        $sequence_7 = { c60741 e9???????? 6685c2 0f854c010000 488b01 488b6818 6644854912 }
            // n = 7, score = 100
            //   c60741               | dec                 ecx
            //   e9????????           |                     
            //   6685c2               | mov                 eax, dword ptr [edi]
            //   0f854c010000         | inc                 ecx
            //   488b01               | cmp                 byte ptr [edi + 0x12c], 2
            //   488b6818             | jae                 0x1981
            //   6644854912           | dec                 ecx

        $sequence_8 = { eb38 4885f6 740f ba40000000 488bce e8???????? eb0a }
            // n = 7, score = 100
            //   eb38                 | inc                 esp
            //   4885f6               | mov                 byte ptr [esi + 0x58], bh
            //   740f                 | inc                 esp
            //   ba40000000           | mov                 dword ptr [esi + 0x50], edi
            //   488bce               | inc                 esp
            //   e8????????           |                     
            //   eb0a                 | mov                 dword ptr [esi + 8], edi

        $sequence_9 = { c7452801000000 e9???????? ba48000000 498bcc e8???????? 488bf8 4885c0 }
            // n = 7, score = 100
            //   c7452801000000       | inc                 ecx
            //   e9????????           |                     
            //   ba48000000           | mov                 eax, dword ptr [esi + 0x38]
            //   498bcc               | lea                 ecx, [eax + 1]
            //   e8????????           |                     
            //   488bf8               | add                 eax, esi
            //   4885c0               | inc                 ecx

    condition:
        7 of them and filesize < 2401280
}