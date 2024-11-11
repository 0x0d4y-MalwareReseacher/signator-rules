rule win_jolob_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.jolob."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.jolob"
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
        $sequence_0 = { ff75f0 8d45f8 50 ff7618 e8???????? 5f c9 }
            // n = 7, score = 300
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax
            //   ff7618               | push                dword ptr [esi + 0x18]
            //   e8????????           |                     
            //   5f                   | pop                 edi
            //   c9                   | leave               

        $sequence_1 = { 881408 41 84d2 75f6 8d95fafeffff 8bc7 }
            // n = 6, score = 300
            //   881408               | mov                 byte ptr [eax + ecx], dl
            //   41                   | inc                 ecx
            //   84d2                 | test                dl, dl
            //   75f6                 | jne                 0xfffffff8
            //   8d95fafeffff         | lea                 edx, [ebp - 0x106]
            //   8bc7                 | mov                 eax, edi

        $sequence_2 = { 740b 50 ff15???????? 834b14ff c3 }
            // n = 5, score = 300
            //   740b                 | je                  0xd
            //   50                   | push                eax
            //   ff15????????         |                     
            //   834b14ff             | or                  dword ptr [ebx + 0x14], 0xffffffff
            //   c3                   | ret                 

        $sequence_3 = { 40 5f c9 c20800 8b06 83f8ff }
            // n = 6, score = 300
            //   40                   | inc                 eax
            //   5f                   | pop                 edi
            //   c9                   | leave               
            //   c20800               | ret                 8
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   83f8ff               | cmp                 eax, -1

        $sequence_4 = { 5f 8bc3 5b 64890d00000000 c9 c20400 53 }
            // n = 7, score = 300
            //   5f                   | pop                 edi
            //   8bc3                 | mov                 eax, ebx
            //   5b                   | pop                 ebx
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx
            //   c9                   | leave               
            //   c20400               | ret                 4
            //   53                   | push                ebx

        $sequence_5 = { 34a3 8886de000000 8a86cf000000 34a6 8886df000000 83c610 56 }
            // n = 7, score = 300
            //   34a3                 | xor                 al, 0xa3
            //   8886de000000         | mov                 byte ptr [esi + 0xde], al
            //   8a86cf000000         | mov                 al, byte ptr [esi + 0xcf]
            //   34a6                 | xor                 al, 0xa6
            //   8886df000000         | mov                 byte ptr [esi + 0xdf], al
            //   83c610               | add                 esi, 0x10
            //   56                   | push                esi

        $sequence_6 = { 83c004 83c704 83fe04 7ce4 33f6 }
            // n = 5, score = 300
            //   83c004               | add                 eax, 4
            //   83c704               | add                 edi, 4
            //   83fe04               | cmp                 esi, 4
            //   7ce4                 | jl                  0xffffffe6
            //   33f6                 | xor                 esi, esi

        $sequence_7 = { 75f8 8d442420 50 ff730c e8???????? 85c0 74c3 }
            // n = 7, score = 300
            //   75f8                 | jne                 0xfffffffa
            //   8d442420             | lea                 eax, [esp + 0x20]
            //   50                   | push                eax
            //   ff730c               | push                dword ptr [ebx + 0xc]
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   74c3                 | je                  0xffffffc5

        $sequence_8 = { 0fafc1 894634 ff15???????? 8bf8 897e40 3bfb }
            // n = 6, score = 300
            //   0fafc1               | imul                eax, ecx
            //   894634               | mov                 dword ptr [esi + 0x34], eax
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   897e40               | mov                 dword ptr [esi + 0x40], edi
            //   3bfb                 | cmp                 edi, ebx

        $sequence_9 = { 8a5415e4 885405f4 40 46 3bc3 7ceb ff4d08 }
            // n = 7, score = 300
            //   8a5415e4             | mov                 dl, byte ptr [ebp + edx - 0x1c]
            //   885405f4             | mov                 byte ptr [ebp + eax - 0xc], dl
            //   40                   | inc                 eax
            //   46                   | inc                 esi
            //   3bc3                 | cmp                 eax, ebx
            //   7ceb                 | jl                  0xffffffed
            //   ff4d08               | dec                 dword ptr [ebp + 8]

    condition:
        7 of them and filesize < 196608
}