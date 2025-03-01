rule win_wndtest_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.wndtest."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.wndtest"
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
        $sequence_0 = { 56 0fbe7001 33750c 57 8d4e01 51 }
            // n = 6, score = 400
            //   56                   | push                esi
            //   0fbe7001             | movsx               esi, byte ptr [eax + 1]
            //   33750c               | xor                 esi, dword ptr [ebp + 0xc]
            //   57                   | push                edi
            //   8d4e01               | lea                 ecx, [esi + 1]
            //   51                   | push                ecx

        $sequence_1 = { 8b0d???????? 53 56 0fbe7001 }
            // n = 4, score = 400
            //   8b0d????????         |                     
            //   53                   | push                ebx
            //   56                   | push                esi
            //   0fbe7001             | movsx               esi, byte ptr [eax + 1]

        $sequence_2 = { 8bf0 56 6803000010 57 ffd3 85c0 741c }
            // n = 7, score = 400
            //   8bf0                 | mov                 esi, eax
            //   56                   | push                esi
            //   6803000010           | push                0x10000003
            //   57                   | push                edi
            //   ffd3                 | call                ebx
            //   85c0                 | test                eax, eax
            //   741c                 | je                  0x1e

        $sequence_3 = { ff15???????? 8b3d???????? 85ff 7444 8bcb 8bc7 }
            // n = 6, score = 400
            //   ff15????????         |                     
            //   8b3d????????         |                     
            //   85ff                 | test                edi, edi
            //   7444                 | je                  0x46
            //   8bcb                 | mov                 ecx, ebx
            //   8bc7                 | mov                 eax, edi

        $sequence_4 = { 6a01 6a00 6a07 6a00 ff15???????? 8d7eff }
            // n = 6, score = 400
            //   6a01                 | push                1
            //   6a00                 | push                0
            //   6a07                 | push                7
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8d7eff               | lea                 edi, [esi - 1]

        $sequence_5 = { 8d4e01 51 e8???????? 83c404 33c9 }
            // n = 5, score = 400
            //   8d4e01               | lea                 ecx, [esi + 1]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   33c9                 | xor                 ecx, ecx

        $sequence_6 = { ffd7 8b15???????? a3???????? a1???????? 52 50 e8???????? }
            // n = 7, score = 400
            //   ffd7                 | call                edi
            //   8b15????????         |                     
            //   a3????????           |                     
            //   a1????????           |                     
            //   52                   | push                edx
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_7 = { ffd7 8d55e0 52 ffd3 6a00 }
            // n = 5, score = 400
            //   ffd7                 | call                edi
            //   8d55e0               | lea                 edx, [ebp - 0x20]
            //   52                   | push                edx
            //   ffd3                 | call                ebx
            //   6a00                 | push                0

        $sequence_8 = { 83c410 56 53 ffd7 50 }
            // n = 5, score = 400
            //   83c410               | add                 esp, 0x10
            //   56                   | push                esi
            //   53                   | push                ebx
            //   ffd7                 | call                edi
            //   50                   | push                eax

        $sequence_9 = { 75ea 8bcb 0fb6d2 c1e918 33ca }
            // n = 5, score = 400
            //   75ea                 | jne                 0xffffffec
            //   8bcb                 | mov                 ecx, ebx
            //   0fb6d2               | movzx               edx, dl
            //   c1e918               | shr                 ecx, 0x18
            //   33ca                 | xor                 ecx, edx

    condition:
        7 of them and filesize < 901120
}