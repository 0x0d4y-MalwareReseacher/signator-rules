rule win_hyperssl_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.hyperssl."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hyperssl"
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
        $sequence_0 = { 3bdf 7527 40 8d7e04 }
            // n = 4, score = 200
            //   3bdf                 | cmp                 ebx, edi
            //   7527                 | jne                 0x29
            //   40                   | inc                 eax
            //   8d7e04               | lea                 edi, [esi + 4]

        $sequence_1 = { 4f 75f2 5f 5e e9???????? c3 55 }
            // n = 7, score = 200
            //   4f                   | dec                 edi
            //   75f2                 | jne                 0xfffffff4
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   e9????????           |                     
            //   c3                   | ret                 
            //   55                   | push                ebp

        $sequence_2 = { 0101 0100 0100 0100 }
            // n = 4, score = 200
            //   0101                 | add                 dword ptr [ecx], eax
            //   0100                 | add                 dword ptr [eax], eax
            //   0100                 | add                 dword ptr [eax], eax
            //   0100                 | add                 dword ptr [eax], eax

        $sequence_3 = { 0101 014514 2bf3 8b5d0c }
            // n = 4, score = 200
            //   0101                 | add                 dword ptr [ecx], eax
            //   014514               | add                 dword ptr [ebp + 0x14], eax
            //   2bf3                 | sub                 esi, ebx
            //   8b5d0c               | mov                 ebx, dword ptr [ebp + 0xc]

        $sequence_4 = { 742a 8b4028 03c1 7423 56 }
            // n = 5, score = 200
            //   742a                 | je                  0x2c
            //   8b4028               | mov                 eax, dword ptr [eax + 0x28]
            //   03c1                 | add                 eax, ecx
            //   7423                 | je                  0x25
            //   56                   | push                esi

        $sequence_5 = { 0105???????? 8d8d5cffffff 89855cffffff 898560ffffff }
            // n = 4, score = 200
            //   0105????????         |                     
            //   8d8d5cffffff         | lea                 ecx, [ebp - 0xa4]
            //   89855cffffff         | mov                 dword ptr [ebp - 0xa4], eax
            //   898560ffffff         | mov                 dword ptr [ebp - 0xa0], eax

        $sequence_6 = { 0105???????? 8d558c 89458c 894590 }
            // n = 4, score = 200
            //   0105????????         |                     
            //   8d558c               | lea                 edx, [ebp - 0x74]
            //   89458c               | mov                 dword ptr [ebp - 0x74], eax
            //   894590               | mov                 dword ptr [ebp - 0x70], eax

        $sequence_7 = { 0100 0200 0200 0002 0002 }
            // n = 5, score = 200
            //   0100                 | add                 dword ptr [eax], eax
            //   0200                 | add                 al, byte ptr [eax]
            //   0200                 | add                 al, byte ptr [eax]
            //   0002                 | add                 byte ptr [edx], al
            //   0002                 | add                 byte ptr [edx], al

        $sequence_8 = { 0108 894810 8b4830 3308 }
            // n = 4, score = 200
            //   0108                 | add                 dword ptr [eax], ecx
            //   894810               | mov                 dword ptr [eax + 0x10], ecx
            //   8b4830               | mov                 ecx, dword ptr [eax + 0x30]
            //   3308                 | xor                 ecx, dword ptr [eax]

        $sequence_9 = { 7423 56 57 b9???????? be???????? }
            // n = 5, score = 200
            //   7423                 | je                  0x25
            //   56                   | push                esi
            //   57                   | push                edi
            //   b9????????           |                     
            //   be????????           |                     

        $sequence_10 = { 8a10 301401 8a10 301406 40 }
            // n = 5, score = 200
            //   8a10                 | mov                 dl, byte ptr [eax]
            //   301401               | xor                 byte ptr [ecx + eax], dl
            //   8a10                 | mov                 dl, byte ptr [eax]
            //   301406               | xor                 byte ptr [esi + eax], dl
            //   40                   | inc                 eax

        $sequence_11 = { c20c00 6a08 68???????? e8???????? 8b450c 83f801 757a }
            // n = 7, score = 200
            //   c20c00               | ret                 0xc
            //   6a08                 | push                8
            //   68????????           |                     
            //   e8????????           |                     
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   83f801               | cmp                 eax, 1
            //   757a                 | jne                 0x7c

        $sequence_12 = { 2bc8 2bf0 5f 8a10 301401 }
            // n = 5, score = 200
            //   2bc8                 | sub                 ecx, eax
            //   2bf0                 | sub                 esi, eax
            //   5f                   | pop                 edi
            //   8a10                 | mov                 dl, byte ptr [eax]
            //   301401               | xor                 byte ptr [ecx + eax], dl

        $sequence_13 = { 0108 3310 c1c607 c1c210 }
            // n = 4, score = 200
            //   0108                 | add                 dword ptr [eax], ecx
            //   3310                 | xor                 edx, dword ptr [eax]
            //   c1c607               | rol                 esi, 7
            //   c1c210               | rol                 edx, 0x10

        $sequence_14 = { 85c9 7436 8b413c 03c1 742a 8b4028 }
            // n = 6, score = 200
            //   85c9                 | test                ecx, ecx
            //   7436                 | je                  0x38
            //   8b413c               | mov                 eax, dword ptr [ecx + 0x3c]
            //   03c1                 | add                 eax, ecx
            //   742a                 | je                  0x2c
            //   8b4028               | mov                 eax, dword ptr [eax + 0x28]

        $sequence_15 = { 33c0 40 5d c20c00 6a08 }
            // n = 5, score = 200
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax
            //   5d                   | pop                 ebp
            //   c20c00               | ret                 0xc
            //   6a08                 | push                8

    condition:
        7 of them and filesize < 835584
}