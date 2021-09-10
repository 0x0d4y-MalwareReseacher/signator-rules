rule win_listrix_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.listrix."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.listrix"
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
        $sequence_0 = { 83e4f8 81ec64010000 a1???????? 33c4 89842460010000 56 8b35???????? }
            // n = 7, score = 100
            //   83e4f8               | and                 esp, 0xfffffff8
            //   81ec64010000         | sub                 esp, 0x164
            //   a1????????           |                     
            //   33c4                 | xor                 eax, esp
            //   89842460010000       | mov                 dword ptr [esp + 0x160], eax
            //   56                   | push                esi
            //   8b35????????         |                     

        $sequence_1 = { ff15???????? 85c0 0f8527feffff 8bb588f5ffff 53 ff15???????? }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f8527feffff         | jne                 0xfffffe2d
            //   8bb588f5ffff         | mov                 esi, dword ptr [ebp - 0xa78]
            //   53                   | push                ebx
            //   ff15????????         |                     

        $sequence_2 = { ff15???????? 8bb58cf5ffff 8b9d90f5ffff 8d8d94f5ffff }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   8bb58cf5ffff         | mov                 esi, dword ptr [ebp - 0xa74]
            //   8b9d90f5ffff         | mov                 ebx, dword ptr [ebp - 0xa70]
            //   8d8d94f5ffff         | lea                 ecx, dword ptr [ebp - 0xa6c]

        $sequence_3 = { 0f8408010000 be???????? 68???????? 8d442464 }
            // n = 4, score = 100
            //   0f8408010000         | je                  0x10e
            //   be????????           |                     
            //   68????????           |                     
            //   8d442464             | lea                 eax, dword ptr [esp + 0x64]

        $sequence_4 = { 68???????? ff15???????? 68d0070000 ffd6 68dc050000 }
            // n = 5, score = 100
            //   68????????           |                     
            //   ff15????????         |                     
            //   68d0070000           | push                0x7d0
            //   ffd6                 | call                esi
            //   68dc050000           | push                0x5dc

        $sequence_5 = { 668b4c4310 66890c457ca74000 40 ebe8 33c0 }
            // n = 5, score = 100
            //   668b4c4310           | mov                 cx, word ptr [ebx + eax*2 + 0x10]
            //   66890c457ca74000     | mov                 word ptr [eax*2 + 0x40a77c], cx
            //   40                   | inc                 eax
            //   ebe8                 | jmp                 0xffffffea
            //   33c0                 | xor                 eax, eax

        $sequence_6 = { 33c0 5d c3 8b04c51c6a4000 }
            // n = 4, score = 100
            //   33c0                 | xor                 eax, eax
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b04c51c6a4000       | mov                 eax, dword ptr [eax*8 + 0x406a1c]

        $sequence_7 = { 89442408 c744240c02000000 85c0 0f8408010000 }
            // n = 4, score = 100
            //   89442408             | mov                 dword ptr [esp + 8], eax
            //   c744240c02000000     | mov                 dword ptr [esp + 0xc], 2
            //   85c0                 | test                eax, eax
            //   0f8408010000         | je                  0x10e

        $sequence_8 = { 5e 85c0 7434 6a00 }
            // n = 4, score = 100
            //   5e                   | pop                 esi
            //   85c0                 | test                eax, eax
            //   7434                 | je                  0x36
            //   6a00                 | push                0

        $sequence_9 = { 8d85f4fdffff 68???????? 50 ffd6 68fe000000 }
            // n = 5, score = 100
            //   8d85f4fdffff         | lea                 eax, dword ptr [ebp - 0x20c]
            //   68????????           |                     
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   68fe000000           | push                0xfe

    condition:
        7 of them and filesize < 106496
}