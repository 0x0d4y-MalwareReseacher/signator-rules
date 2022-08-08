rule win_shujin_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.shujin."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.shujin"
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
        $sequence_0 = { e8???????? ff35???????? 8b35???????? 8bd8 8d8500ffffff 68???????? 50 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   ff35????????         |                     
            //   8b35????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   8d8500ffffff         | lea                 eax, [ebp - 0x100]
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_1 = { 60 8954241c 0fca 668b542404 0f90c2 }
            // n = 5, score = 100
            //   60                   | pushal              
            //   8954241c             | mov                 dword ptr [esp + 0x1c], edx
            //   0fca                 | bswap               edx
            //   668b542404           | mov                 dx, word ptr [esp + 4]
            //   0f90c2               | seto                dl

        $sequence_2 = { 88041e 46 83fe20 7ce1 33c0 5f }
            // n = 6, score = 100
            //   88041e               | mov                 byte ptr [esi + ebx], al
            //   46                   | inc                 esi
            //   83fe20               | cmp                 esi, 0x20
            //   7ce1                 | jl                  0xffffffe3
            //   33c0                 | xor                 eax, eax
            //   5f                   | pop                 edi

        $sequence_3 = { 8b35???????? 68???????? 8d442424 50 ffd6 85c0 7513 }
            // n = 7, score = 100
            //   8b35????????         |                     
            //   68????????           |                     
            //   8d442424             | lea                 eax, [esp + 0x24]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   7513                 | jne                 0x15

        $sequence_4 = { 7586 8bd0 c1f81a 8bf2 }
            // n = 4, score = 100
            //   7586                 | jne                 0xffffff88
            //   8bd0                 | mov                 edx, eax
            //   c1f81a               | sar                 eax, 0x1a
            //   8bf2                 | mov                 esi, edx

        $sequence_5 = { 72e9 8d45b8 50 ff15???????? 83f840 7549 }
            // n = 6, score = 100
            //   72e9                 | jb                  0xffffffeb
            //   8d45b8               | lea                 eax, [ebp - 0x48]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83f840               | cmp                 eax, 0x40
            //   7549                 | jne                 0x4b

        $sequence_6 = { ff15???????? 83f801 0f8454ffffff 53 ff15???????? 5f 5e }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   83f801               | cmp                 eax, 1
            //   0f8454ffffff         | je                  0xffffff5a
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_7 = { 884c2408 68cdd15fea 9c 9c ff35???????? 8f44242c 9c }
            // n = 7, score = 100
            //   884c2408             | mov                 byte ptr [esp + 8], cl
            //   68cdd15fea           | push                0xea5fd1cd
            //   9c                   | pushfd              
            //   9c                   | pushfd              
            //   ff35????????         |                     
            //   8f44242c             | pop                 dword ptr [esp + 0x2c]
            //   9c                   | pushfd              

        $sequence_8 = { 03f8 a0???????? a801 7421 8b45a8 c1e810 84c0 }
            // n = 7, score = 100
            //   03f8                 | add                 edi, eax
            //   a0????????           |                     
            //   a801                 | test                al, 1
            //   7421                 | je                  0x23
            //   8b45a8               | mov                 eax, dword ptr [ebp - 0x58]
            //   c1e810               | shr                 eax, 0x10
            //   84c0                 | test                al, al

        $sequence_9 = { 8b7dfc 8b5dfc 33fe 237df0 23de 33fb 03cf }
            // n = 7, score = 100
            //   8b7dfc               | mov                 edi, dword ptr [ebp - 4]
            //   8b5dfc               | mov                 ebx, dword ptr [ebp - 4]
            //   33fe                 | xor                 edi, esi
            //   237df0               | and                 edi, dword ptr [ebp - 0x10]
            //   23de                 | and                 ebx, esi
            //   33fb                 | xor                 edi, ebx
            //   03cf                 | add                 ecx, edi

    condition:
        7 of them and filesize < 172032
}