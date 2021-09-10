rule win_dorshel_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.dorshel."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dorshel"
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
        $sequence_0 = { 55 8bec 83ec0c 31c0 648b5030 8b520c 8b5214 }
            // n = 7, score = 100
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec0c               | sub                 esp, 0xc
            //   31c0                 | xor                 eax, eax
            //   648b5030             | mov                 edx, dword ptr fs:[eax + 0x30]
            //   8b520c               | mov                 edx, dword ptr [edx + 0xc]
            //   8b5214               | mov                 edx, dword ptr [edx + 0x14]

        $sequence_1 = { 8d7708 8b3f 33fb f3a4 5f }
            // n = 5, score = 100
            //   8d7708               | lea                 esi, dword ptr [edi + 8]
            //   8b3f                 | mov                 edi, dword ptr [edi]
            //   33fb                 | xor                 edi, ebx
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   5f                   | pop                 edi

        $sequence_2 = { 03f8 84c0 75f6 81ff5e515e83 7408 81ff36cadb30 75da }
            // n = 7, score = 100
            //   03f8                 | add                 edi, eax
            //   84c0                 | test                al, al
            //   75f6                 | jne                 0xfffffff8
            //   81ff5e515e83         | cmp                 edi, 0x835e515e
            //   7408                 | je                  0xa
            //   81ff36cadb30         | cmp                 edi, 0x30dbca36
            //   75da                 | jne                 0xffffffdc

        $sequence_3 = { 83c004 e2f9 58 54 50 }
            // n = 5, score = 100
            //   83c004               | add                 eax, 4
            //   e2f9                 | loop                0xfffffffb
            //   58                   | pop                 eax
            //   54                   | push                esp
            //   50                   | push                eax

        $sequence_4 = { 51 8b0f 33cb 51 ff55f8 8b5df4 }
            // n = 6, score = 100
            //   51                   | push                ecx
            //   8b0f                 | mov                 ecx, dword ptr [edi]
            //   33cb                 | xor                 ecx, ebx
            //   51                   | push                ecx
            //   ff55f8               | call                dword ptr [ebp - 8]
            //   8b5df4               | mov                 ebx, dword ptr [ebp - 0xc]

        $sequence_5 = { 54 50 8b4f04 33cb 51 8b0f }
            // n = 6, score = 100
            //   54                   | push                esp
            //   50                   | push                eax
            //   8b4f04               | mov                 ecx, dword ptr [edi + 4]
            //   33cb                 | xor                 ecx, ebx
            //   51                   | push                ecx
            //   8b0f                 | mov                 ecx, dword ptr [edi]

        $sequence_6 = { ffd5 85c0 74cd 8b07 01c3 }
            // n = 5, score = 100
            //   ffd5                 | call                ebp
            //   85c0                 | test                eax, eax
            //   74cd                 | je                  0xffffffcf
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   01c3                 | add                 ebx, eax

        $sequence_7 = { ac c1cf0d 03f8 84c0 75f6 81ff5e515e83 7408 }
            // n = 7, score = 100
            //   ac                   | lodsb               al, byte ptr [esi]
            //   c1cf0d               | ror                 edi, 0xd
            //   03f8                 | add                 edi, eax
            //   84c0                 | test                al, al
            //   75f6                 | jne                 0xfffffff8
            //   81ff5e515e83         | cmp                 edi, 0x835e515e
            //   7408                 | je                  0xa

        $sequence_8 = { 57 6800200000 53 56 68129689e2 ffd5 85c0 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   6800200000           | push                0x2000
            //   53                   | push                ebx
            //   56                   | push                esi
            //   68129689e2           | push                0xe2899612
            //   ffd5                 | call                ebp
            //   85c0                 | test                eax, eax

        $sequence_9 = { 5f 8b4704 33c3 83c104 99 }
            // n = 5, score = 100
            //   5f                   | pop                 edi
            //   8b4704               | mov                 eax, dword ptr [edi + 4]
            //   33c3                 | xor                 eax, ebx
            //   83c104               | add                 ecx, 4
            //   99                   | cdq                 

    condition:
        7 of them and filesize < 24576
}