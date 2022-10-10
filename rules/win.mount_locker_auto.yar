rule win_mount_locker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.mount_locker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mount_locker"
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
        $sequence_0 = { 488364242000 4c8d4c2468 448bc7 488bd3 ff15???????? }
            // n = 5, score = 300
            //   488364242000         | inc                 ebp
            //   4c8d4c2468           | mov                 dword ptr [esp + 0x14], ebp
            //   448bc7               | dec                 esp
            //   488bd3               | mov                 ebp, dword ptr [esp + 0x20]
            //   ff15????????         |                     

        $sequence_1 = { b901000000 ff13 33c9 85c0 7415 }
            // n = 5, score = 300
            //   b901000000           | dec                 ebp
            //   ff13                 | mov                 esi, dword ptr [ebx + 0x28]
            //   33c9                 | dec                 ecx
            //   85c0                 | mov                 esp, ebx
            //   7415                 | pop                 ebp

        $sequence_2 = { 7423 488b0d???????? 4885c9 7417 488364242000 4c8d4c2468 448bc7 }
            // n = 7, score = 300
            //   7423                 | shl                 ecx, 8
            //   488b0d????????       |                     
            //   4885c9               | or                  ecx, eax
            //   7417                 | movzx               eax, byte ptr [edx]
            //   488364242000         | shl                 ecx, 8
            //   4c8d4c2468           | or                  ecx, eax
            //   448bc7               | inc                 ecx

        $sequence_3 = { 8bd8 85c0 7433 488364242800 4c8d442430 488364242000 }
            // n = 6, score = 300
            //   8bd8                 | mov                 ecx, ebx
            //   85c0                 | dec                 eax
            //   7433                 | and                 dword ptr [esp + 0x30], 0
            //   488364242800         | inc                 ebp
            //   4c8d442430           | xor                 ecx, ecx
            //   488364242000         | and                 dword ptr [esp + 0x28], 0

        $sequence_4 = { 57 4156 4883ec30 498be8 }
            // n = 4, score = 300
            //   57                   | mov                 edx, eax
            //   4156                 | dec                 eax
            //   4883ec30             | mov                 ebx, eax
            //   498be8               | dec                 eax

        $sequence_5 = { ff15???????? 8bd8 ff15???????? 488d4de0 }
            // n = 4, score = 300
            //   ff15????????         |                     
            //   8bd8                 | lea                 edx, [0x60df]
            //   ff15????????         |                     
            //   488d4de0             | mov                 word ptr [ebp - 0x70], di

        $sequence_6 = { ff15???????? 4c8b05???????? 488bcb 488b15???????? e8???????? 85c0 }
            // n = 6, score = 300
            //   ff15????????         |                     
            //   4c8b05????????       |                     
            //   488bcb               | dec                 eax
            //   488b15????????       |                     
            //   e8????????           |                     
            //   85c0                 | mov                 esi, dword ptr [esp + 0x38]

        $sequence_7 = { 751e 488b0d???????? 488d542420 ff15???????? 8b442424 8905???????? eb0d }
            // n = 7, score = 300
            //   751e                 | inc                 ecx
            //   488b0d????????       |                     
            //   488d542420           | movzx               ecx, byte ptr [eax + 3]
            //   ff15????????         |                     
            //   8b442424             | shl                 ecx, 8
            //   8905????????         |                     
            //   eb0d                 | or                  ecx, eax

        $sequence_8 = { 48896c2410 56 57 4156 4883ec30 498be8 4d8bc8 }
            // n = 7, score = 300
            //   48896c2410           | and                 dword ptr [esp + 0x20], 0
            //   56                   | dec                 esp
            //   57                   | lea                 ecx, [esp + 0x68]
            //   4156                 | dec                 eax
            //   4883ec30             | lea                 edx, [0x5845]
            //   498be8               | test                eax, eax
            //   4d8bc8               | je                  0x3e8

        $sequence_9 = { 4533c9 41b814010000 ff15???????? 8bd8 }
            // n = 4, score = 300
            //   4533c9               | dec                 esp
            //   41b814010000         | mov                 esi, eax
            //   ff15????????         |                     
            //   8bd8                 | dec                 eax

    condition:
        7 of them and filesize < 225280
}