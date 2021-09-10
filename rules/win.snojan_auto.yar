rule win_snojan_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.snojan."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.snojan"
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
        $sequence_0 = { 893c24 89442404 ff15???????? 83ec0c 83f8ff }
            // n = 5, score = 200
            //   893c24               | mov                 dword ptr [esp], edi
            //   89442404             | mov                 dword ptr [esp + 4], eax
            //   ff15????????         |                     
            //   83ec0c               | sub                 esp, 0xc
            //   83f8ff               | cmp                 eax, -1

        $sequence_1 = { 0fb745cc 8b4dc0 6689810000986d 83c30c 81fb???????? 0f8285feffff e9???????? }
            // n = 7, score = 200
            //   0fb745cc             | movzx               eax, word ptr [ebp - 0x34]
            //   8b4dc0               | mov                 ecx, dword ptr [ebp - 0x40]
            //   6689810000986d       | mov                 word ptr [ecx + 0x6d980000], ax
            //   83c30c               | add                 ebx, 0xc
            //   81fb????????         |                     
            //   0f8285feffff         | jb                  0xfffffe8b
            //   e9????????           |                     

        $sequence_2 = { e8???????? 83fd03 7e2f 8d442bfc c744240804000000 c7442404???????? }
            // n = 6, score = 200
            //   e8????????           |                     
            //   83fd03               | cmp                 ebp, 3
            //   7e2f                 | jle                 0x31
            //   8d442bfc             | lea                 eax, dword ptr [ebx + ebp - 4]
            //   c744240804000000     | mov                 dword ptr [esp + 8], 4
            //   c7442404????????     |                     

        $sequence_3 = { 83f8ff 0f8452010000 c7442404???????? c70424???????? e8???????? }
            // n = 5, score = 200
            //   83f8ff               | cmp                 eax, -1
            //   0f8452010000         | je                  0x158
            //   c7442404????????     |                     
            //   c70424????????       |                     
            //   e8????????           |                     

        $sequence_4 = { e8???????? 85c0 74e9 a1???????? 8b988000986d 85db 74da }
            // n = 7, score = 200
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   74e9                 | je                  0xffffffeb
            //   a1????????           |                     
            //   8b988000986d         | mov                 ebx, dword ptr [eax + 0x6d980080]
            //   85db                 | test                ebx, ebx
            //   74da                 | je                  0xffffffdc

        $sequence_5 = { 57 b83c900100 56 53 e8???????? }
            // n = 5, score = 200
            //   57                   | push                edi
            //   b83c900100           | mov                 eax, 0x1903c
            //   56                   | push                esi
            //   53                   | push                ebx
            //   e8????????           |                     

        $sequence_6 = { 8d442410 c7042402020000 89442404 ff15???????? 83ec08 85c0 750e }
            // n = 7, score = 200
            //   8d442410             | lea                 eax, dword ptr [esp + 0x10]
            //   c7042402020000       | mov                 dword ptr [esp], 0x202
            //   89442404             | mov                 dword ptr [esp + 4], eax
            //   ff15????????         |                     
            //   83ec08               | sub                 esp, 8
            //   85c0                 | test                eax, eax
            //   750e                 | jne                 0x10

        $sequence_7 = { c7442408???????? c744240400000000 c7042400000000 ff15???????? 83ec18 e8???????? }
            // n = 6, score = 200
            //   c7442408????????     |                     
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   c7042400000000       | mov                 dword ptr [esp], 0
            //   ff15????????         |                     
            //   83ec18               | sub                 esp, 0x18
            //   e8????????           |                     

        $sequence_8 = { 8b4dc0 6689810000986d 83c30c 81fb???????? 0f8285feffff e9???????? 0fb606 }
            // n = 7, score = 200
            //   8b4dc0               | mov                 ecx, dword ptr [ebp - 0x40]
            //   6689810000986d       | mov                 word ptr [ecx + 0x6d980000], ax
            //   83c30c               | add                 ebx, 0xc
            //   81fb????????         |                     
            //   0f8285feffff         | jb                  0xfffffe8b
            //   e9????????           |                     
            //   0fb606               | movzx               eax, byte ptr [esi]

        $sequence_9 = { 8d442420 c744240810000000 893c24 89442404 ff15???????? }
            // n = 5, score = 200
            //   8d442420             | lea                 eax, dword ptr [esp + 0x20]
            //   c744240810000000     | mov                 dword ptr [esp + 8], 0x10
            //   893c24               | mov                 dword ptr [esp], edi
            //   89442404             | mov                 dword ptr [esp + 4], eax
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 90112
}