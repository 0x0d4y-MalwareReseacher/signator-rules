rule win_pngdowner_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.pngdowner."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pngdowner"
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
        $sequence_0 = { 5b 81c420000100 c3 57 ff15???????? 5f }
            // n = 6, score = 200
            //   5b                   | pop                 ebx
            //   81c420000100         | add                 esp, 0x10020
            //   c3                   | ret                 
            //   57                   | push                edi
            //   ff15????????         |                     
            //   5f                   | pop                 edi

        $sequence_1 = { 59 743e 8305????????20 8d0c9d40e64000 }
            // n = 4, score = 200
            //   59                   | pop                 ecx
            //   743e                 | je                  0x40
            //   8305????????20       |                     
            //   8d0c9d40e64000       | lea                 ecx, [ebx*4 + 0x40e640]

        $sequence_2 = { 68???????? e8???????? 83c408 83c8ff 5f 5e 5d }
            // n = 7, score = 200
            //   68????????           |                     
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   83c8ff               | or                  eax, 0xffffffff
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp

        $sequence_3 = { c1f904 83e10f 5f c1e204 }
            // n = 4, score = 200
            //   c1f904               | sar                 ecx, 4
            //   83e10f               | and                 ecx, 0xf
            //   5f                   | pop                 edi
            //   c1e204               | shl                 edx, 4

        $sequence_4 = { 89542414 c644240d73 ff15???????? 85c0 7430 68???????? 50 }
            // n = 7, score = 200
            //   89542414             | mov                 dword ptr [esp + 0x14], edx
            //   c644240d73           | mov                 byte ptr [esp + 0xd], 0x73
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7430                 | je                  0x32
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_5 = { 57 55 55 55 55 68???????? }
            // n = 6, score = 200
            //   57                   | push                edi
            //   55                   | push                ebp
            //   55                   | push                ebp
            //   55                   | push                ebp
            //   55                   | push                ebp
            //   68????????           |                     

        $sequence_6 = { 8b4c2410 51 6880000000 52 e8???????? 83c40c 85c0 }
            // n = 7, score = 200
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]
            //   51                   | push                ecx
            //   6880000000           | push                0x80
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax

        $sequence_7 = { 8d4c2420 51 50 68???????? 68???????? 6a00 56 }
            // n = 7, score = 200
            //   8d4c2420             | lea                 ecx, [esp + 0x20]
            //   51                   | push                ecx
            //   50                   | push                eax
            //   68????????           |                     
            //   68????????           |                     
            //   6a00                 | push                0
            //   56                   | push                esi

        $sequence_8 = { 85c0 741c 8d4c242c 6a00 51 8d542438 50 }
            // n = 7, score = 200
            //   85c0                 | test                eax, eax
            //   741c                 | je                  0x1e
            //   8d4c242c             | lea                 ecx, [esp + 0x2c]
            //   6a00                 | push                0
            //   51                   | push                ecx
            //   8d542438             | lea                 edx, [esp + 0x38]
            //   50                   | push                eax

        $sequence_9 = { 8b048540e64000 8d0cf6 8064880400 85ff }
            // n = 4, score = 200
            //   8b048540e64000       | mov                 eax, dword ptr [eax*4 + 0x40e640]
            //   8d0cf6               | lea                 ecx, [esi + esi*8]
            //   8064880400           | and                 byte ptr [eax + ecx*4 + 4], 0
            //   85ff                 | test                edi, edi

    condition:
        7 of them and filesize < 131072
}