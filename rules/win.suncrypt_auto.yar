rule win_suncrypt_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.suncrypt."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.suncrypt"
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
        $sequence_0 = { 8bec 81ec24050000 8d85dcfaffff 56 6a40 50 ff7508 }
            // n = 7, score = 200
            //   8bec                 | mov                 ebp, esp
            //   81ec24050000         | sub                 esp, 0x524
            //   8d85dcfaffff         | lea                 eax, [ebp - 0x524]
            //   56                   | push                esi
            //   6a40                 | push                0x40
            //   50                   | push                eax
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_1 = { 8bf0 ff750c 6a00 6a00 56 ff15???????? 85c0 }
            // n = 7, score = 200
            //   8bf0                 | mov                 esi, eax
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   56                   | push                esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_2 = { 80e10f 80f907 7405 80f906 7552 8b461c 8945fc }
            // n = 7, score = 200
            //   80e10f               | and                 cl, 0xf
            //   80f907               | cmp                 cl, 7
            //   7405                 | je                  7
            //   80f906               | cmp                 cl, 6
            //   7552                 | jne                 0x54
            //   8b461c               | mov                 eax, dword ptr [esi + 0x1c]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_3 = { 5e 5b 8be5 5d c3 33c0 b901000000 }
            // n = 7, score = 200
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   33c0                 | xor                 eax, eax
            //   b901000000           | mov                 ecx, 1

        $sequence_4 = { eb67 8d4601 50 894708 }
            // n = 4, score = 200
            //   eb67                 | jmp                 0x69
            //   8d4601               | lea                 eax, [esi + 1]
            //   50                   | push                eax
            //   894708               | mov                 dword ptr [edi + 8], eax

        $sequence_5 = { 5e 5b 8be5 5d c3 017e0c }
            // n = 6, score = 200
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   017e0c               | add                 dword ptr [esi + 0xc], edi

        $sequence_6 = { 0f8594000000 8b411c 8b5004 8b08 52 51 }
            // n = 6, score = 200
            //   0f8594000000         | jne                 0x9a
            //   8b411c               | mov                 eax, dword ptr [ecx + 0x1c]
            //   8b5004               | mov                 edx, dword ptr [eax + 4]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   52                   | push                edx
            //   51                   | push                ecx

        $sequence_7 = { 0403 83f067 884597 8b4590 0404 83f06e 884598 }
            // n = 7, score = 200
            //   0403                 | add                 al, 3
            //   83f067               | xor                 eax, 0x67
            //   884597               | mov                 byte ptr [ebp - 0x69], al
            //   8b4590               | mov                 eax, dword ptr [ebp - 0x70]
            //   0404                 | add                 al, 4
            //   83f06e               | xor                 eax, 0x6e
            //   884598               | mov                 byte ptr [ebp - 0x68], al

        $sequence_8 = { c645ca7b c645cb7d c645cc68 c645cd6c c645ce22 c645cf38 c645d079 }
            // n = 7, score = 200
            //   c645ca7b             | mov                 byte ptr [ebp - 0x36], 0x7b
            //   c645cb7d             | mov                 byte ptr [ebp - 0x35], 0x7d
            //   c645cc68             | mov                 byte ptr [ebp - 0x34], 0x68
            //   c645cd6c             | mov                 byte ptr [ebp - 0x33], 0x6c
            //   c645ce22             | mov                 byte ptr [ebp - 0x32], 0x22
            //   c645cf38             | mov                 byte ptr [ebp - 0x31], 0x38
            //   c645d079             | mov                 byte ptr [ebp - 0x30], 0x79

        $sequence_9 = { 8d8590fdffff 50 0f118590fdffff 8d8518ffffff 0f1085f0fdffff 50 0f1185a0fdffff }
            // n = 7, score = 200
            //   8d8590fdffff         | lea                 eax, [ebp - 0x270]
            //   50                   | push                eax
            //   0f118590fdffff       | movups              xmmword ptr [ebp - 0x270], xmm0
            //   8d8518ffffff         | lea                 eax, [ebp - 0xe8]
            //   0f1085f0fdffff       | movups              xmm0, xmmword ptr [ebp - 0x210]
            //   50                   | push                eax
            //   0f1185a0fdffff       | movups              xmmword ptr [ebp - 0x260], xmm0

    condition:
        7 of them and filesize < 172032
}