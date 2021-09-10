rule win_plaintee_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.plaintee."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.plaintee"
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
        $sequence_0 = { 3bc6 7cf3 5b 8b542418 8b442414 52 }
            // n = 6, score = 300
            //   3bc6                 | cmp                 eax, esi
            //   7cf3                 | jl                  0xfffffff5
            //   5b                   | pop                 ebx
            //   8b542418             | mov                 edx, dword ptr [esp + 0x18]
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   52                   | push                edx

        $sequence_1 = { e8???????? 85c0 754c 68ac010000 }
            // n = 4, score = 300
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   754c                 | jne                 0x4e
            //   68ac010000           | push                0x1ac

        $sequence_2 = { 8b400c 33c9 33d2 8b00 8a4803 8a5002 51 }
            // n = 7, score = 300
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   33c9                 | xor                 ecx, ecx
            //   33d2                 | xor                 edx, edx
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8a4803               | mov                 cl, byte ptr [eax + 3]
            //   8a5002               | mov                 dl, byte ptr [eax + 2]
            //   51                   | push                ecx

        $sequence_3 = { f7f9 8b4c240c b801000000 80c20a }
            // n = 4, score = 300
            //   f7f9                 | idiv                ecx
            //   8b4c240c             | mov                 ecx, dword ptr [esp + 0xc]
            //   b801000000           | mov                 eax, 1
            //   80c20a               | add                 dl, 0xa

        $sequence_4 = { 52 56 50 ff15???????? 83f85a 721a 8a16 }
            // n = 7, score = 300
            //   52                   | push                edx
            //   56                   | push                esi
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83f85a               | cmp                 eax, 0x5a
            //   721a                 | jb                  0x1c
            //   8a16                 | mov                 dl, byte ptr [esi]

        $sequence_5 = { 85c0 740a b001 5e 81c490010000 }
            // n = 5, score = 300
            //   85c0                 | test                eax, eax
            //   740a                 | je                  0xc
            //   b001                 | mov                 al, 1
            //   5e                   | pop                 esi
            //   81c490010000         | add                 esp, 0x190

        $sequence_6 = { 7e0f 53 8a1c08 32da 881c08 }
            // n = 5, score = 300
            //   7e0f                 | jle                 0x11
            //   53                   | push                ebx
            //   8a1c08               | mov                 bl, byte ptr [eax + ecx]
            //   32da                 | xor                 bl, dl
            //   881c08               | mov                 byte ptr [eax + ecx], bl

        $sequence_7 = { 81c490010000 c3 6a11 6a02 }
            // n = 4, score = 300
            //   81c490010000         | add                 esp, 0x190
            //   c3                   | ret                 
            //   6a11                 | push                0x11
            //   6a02                 | push                2

        $sequence_8 = { 6aff 51 ff15???????? 8a8669010000 }
            // n = 4, score = 300
            //   6aff                 | push                -1
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8a8669010000         | mov                 al, byte ptr [esi + 0x169]

        $sequence_9 = { 6a11 6a02 6a02 ff15???????? 83f8ff }
            // n = 5, score = 300
            //   6a11                 | push                0x11
            //   6a02                 | push                2
            //   6a02                 | push                2
            //   ff15????????         |                     
            //   83f8ff               | cmp                 eax, -1

    condition:
        7 of them and filesize < 73728
}