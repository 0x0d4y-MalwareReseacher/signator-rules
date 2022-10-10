rule win_invisimole_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.invisimole."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.invisimole"
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
        $sequence_0 = { 8bcb 52 d1e9 56 6689144e c6856cffffff04 6689856dffffff }
            // n = 7, score = 100
            //   8bcb                 | mov                 ecx, ebx
            //   52                   | push                edx
            //   d1e9                 | shr                 ecx, 1
            //   56                   | push                esi
            //   6689144e             | mov                 word ptr [esi + ecx*2], dx
            //   c6856cffffff04       | mov                 byte ptr [ebp - 0x94], 4
            //   6689856dffffff       | mov                 word ptr [ebp - 0x93], ax

        $sequence_1 = { 885dfc 8bd8 81e3fdff0000 83cb02 }
            // n = 4, score = 100
            //   885dfc               | mov                 byte ptr [ebp - 4], bl
            //   8bd8                 | mov                 ebx, eax
            //   81e3fdff0000         | and                 ebx, 0xfffd
            //   83cb02               | or                  ebx, 2

        $sequence_2 = { 83c448 85c0 7411 50 }
            // n = 4, score = 100
            //   83c448               | add                 esp, 0x48
            //   85c0                 | test                eax, eax
            //   7411                 | je                  0x13
            //   50                   | push                eax

        $sequence_3 = { 51 6a08 52 ff15???????? eb1b 8b442414 8b15???????? }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   6a08                 | push                8
            //   52                   | push                edx
            //   ff15????????         |                     
            //   eb1b                 | jmp                 0x1d
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   8b15????????         |                     

        $sequence_4 = { a1???????? 56 6a00 50 ff15???????? 8b5df4 }
            // n = 6, score = 100
            //   a1????????           |                     
            //   56                   | push                esi
            //   6a00                 | push                0
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b5df4               | mov                 ebx, dword ptr [ebp - 0xc]

        $sequence_5 = { 52 c68530ffffff0c ff15???????? 85c0 750e ff15???????? }
            // n = 6, score = 100
            //   52                   | push                edx
            //   c68530ffffff0c       | mov                 byte ptr [ebp - 0xd0], 0xc
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   750e                 | jne                 0x10
            //   ff15????????         |                     

        $sequence_6 = { 72d1 8955f0 85d2 7511 8b55ec 8b4d08 52 }
            // n = 7, score = 100
            //   72d1                 | jb                  0xffffffd3
            //   8955f0               | mov                 dword ptr [ebp - 0x10], edx
            //   85d2                 | test                edx, edx
            //   7511                 | jne                 0x13
            //   8b55ec               | mov                 edx, dword ptr [ebp - 0x14]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   52                   | push                edx

        $sequence_7 = { 8d8550faffff 50 ff15???????? 6683bc454efaffff2f c645fc01 7503 885dfc }
            // n = 7, score = 100
            //   8d8550faffff         | lea                 eax, [ebp - 0x5b0]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   6683bc454efaffff2f     | cmp    word ptr [ebp + eax*2 - 0x5b2], 0x2f
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   7503                 | jne                 5
            //   885dfc               | mov                 byte ptr [ebp - 4], bl

        $sequence_8 = { 83ec10 8d45f0 50 8d4d10 51 ff15???????? }
            // n = 6, score = 100
            //   83ec10               | sub                 esp, 0x10
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   50                   | push                eax
            //   8d4d10               | lea                 ecx, [ebp + 0x10]
            //   51                   | push                ecx
            //   ff15????????         |                     

        $sequence_9 = { 8b4004 2bd3 52 03c3 }
            // n = 4, score = 100
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   2bd3                 | sub                 edx, ebx
            //   52                   | push                edx
            //   03c3                 | add                 eax, ebx

    condition:
        7 of them and filesize < 139264
}