rule win_nitol_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.nitol."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nitol"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 75a9 837de400 7588 837de000 0f8563ffffff }
            // n = 5, score = 200
            //   75a9                 | jne                 0xffffffab
            //   837de400             | cmp                 dword ptr [ebp - 0x1c], 0
            //   7588                 | jne                 0xffffff8a
            //   837de000             | cmp                 dword ptr [ebp - 0x20], 0
            //   0f8563ffffff         | jne                 0xffffff69

        $sequence_1 = { 8d45f8 50 6819000200 8d8568fdffff 6a00 50 }
            // n = 6, score = 200
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax
            //   6819000200           | push                0x20019
            //   8d8568fdffff         | lea                 eax, [ebp - 0x298]
            //   6a00                 | push                0
            //   50                   | push                eax

        $sequence_2 = { ff75f4 8d8568ffffff 50 8d8568feffff 50 ffd6 }
            // n = 6, score = 200
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   8d8568ffffff         | lea                 eax, [ebp - 0x98]
            //   50                   | push                eax
            //   8d8568feffff         | lea                 eax, [ebp - 0x198]
            //   50                   | push                eax
            //   ffd6                 | call                esi

        $sequence_3 = { 668945ea 668945ee 8d45bc 50 c645ec80 c645ed11 ff15???????? }
            // n = 7, score = 200
            //   668945ea             | mov                 word ptr [ebp - 0x16], ax
            //   668945ee             | mov                 word ptr [ebp - 0x12], ax
            //   8d45bc               | lea                 eax, [ebp - 0x44]
            //   50                   | push                eax
            //   c645ec80             | mov                 byte ptr [ebp - 0x14], 0x80
            //   c645ed11             | mov                 byte ptr [ebp - 0x13], 0x11
            //   ff15????????         |                     

        $sequence_4 = { 6a00 43 894d08 8901 ffd6 59 85c0 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   43                   | inc                 ebx
            //   894d08               | mov                 dword ptr [ebp + 8], ecx
            //   8901                 | mov                 dword ptr [ecx], eax
            //   ffd6                 | call                esi
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax

        $sequence_5 = { 8d45d8 6a14 50 8d854cffffff 50 e8???????? 8d8540ffffff }
            // n = 7, score = 200
            //   8d45d8               | lea                 eax, [ebp - 0x28]
            //   6a14                 | push                0x14
            //   50                   | push                eax
            //   8d854cffffff         | lea                 eax, [ebp - 0xb4]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d8540ffffff         | lea                 eax, [ebp - 0xc0]

        $sequence_6 = { 3be8 7ce6 e9???????? 833d????????01 8b1d???????? 7532 }
            // n = 6, score = 200
            //   3be8                 | cmp                 ebp, eax
            //   7ce6                 | jl                  0xffffffe8
            //   e9????????           |                     
            //   833d????????01       |                     
            //   8b1d????????         |                     
            //   7532                 | jne                 0x34

        $sequence_7 = { 83c40c 833d????????01 7425 ff75f0 }
            // n = 4, score = 200
            //   83c40c               | add                 esp, 0xc
            //   833d????????01       |                     
            //   7425                 | je                  0x27
            //   ff75f0               | push                dword ptr [ebp - 0x10]

        $sequence_8 = { 50 e8???????? 668945e8 8d45ec 6a14 50 8d8540ffffff }
            // n = 7, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   668945e8             | mov                 word ptr [ebp - 0x18], ax
            //   8d45ec               | lea                 eax, [ebp - 0x14]
            //   6a14                 | push                0x14
            //   50                   | push                eax
            //   8d8540ffffff         | lea                 eax, [ebp - 0xc0]

        $sequence_9 = { 6a05 ff15???????? ff4508 817d08e8030000 7cc7 e9???????? }
            // n = 6, score = 200
            //   6a05                 | push                5
            //   ff15????????         |                     
            //   ff4508               | inc                 dword ptr [ebp + 8]
            //   817d08e8030000       | cmp                 dword ptr [ebp + 8], 0x3e8
            //   7cc7                 | jl                  0xffffffc9
            //   e9????????           |                     

    condition:
        7 of them and filesize < 139264
}