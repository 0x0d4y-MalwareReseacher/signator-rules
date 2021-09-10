rule win_milum_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.milum."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.milum"
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
        $sequence_0 = { 0fb6c0 eb12 8b45e0 8a8084884700 08443b1d 0fb64601 47 }
            // n = 7, score = 400
            //   0fb6c0               | movzx               eax, al
            //   eb12                 | jmp                 0x14
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   8a8084884700         | mov                 al, byte ptr [eax + 0x478884]
            //   08443b1d             | or                  byte ptr [ebx + edi + 0x1d], al
            //   0fb64601             | movzx               eax, byte ptr [esi + 1]
            //   47                   | inc                 edi

        $sequence_1 = { 7408 c700???????? eb02 33c0 c645fc0a 6a58 894678 }
            // n = 7, score = 400
            //   7408                 | je                  0xa
            //   c700????????         |                     
            //   eb02                 | jmp                 4
            //   33c0                 | xor                 eax, eax
            //   c645fc0a             | mov                 byte ptr [ebp - 4], 0xa
            //   6a58                 | push                0x58
            //   894678               | mov                 dword ptr [esi + 0x78], eax

        $sequence_2 = { 83ec08 8bc4 890a 8d75b8 8965b4 c700???????? c7400404000000 }
            // n = 7, score = 400
            //   83ec08               | sub                 esp, 8
            //   8bc4                 | mov                 eax, esp
            //   890a                 | mov                 dword ptr [edx], ecx
            //   8d75b8               | lea                 esi, dword ptr [ebp - 0x48]
            //   8965b4               | mov                 dword ptr [ebp - 0x4c], esp
            //   c700????????         |                     
            //   c7400404000000       | mov                 dword ptr [eax + 4], 4

        $sequence_3 = { 3975cc 720c 8b45b8 50 e8???????? 83c404 bf07000000 }
            // n = 7, score = 400
            //   3975cc               | cmp                 dword ptr [ebp - 0x34], esi
            //   720c                 | jb                  0xe
            //   8b45b8               | mov                 eax, dword ptr [ebp - 0x48]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   bf07000000           | mov                 edi, 7

        $sequence_4 = { 83793800 7503 83c804 6a00 e8???????? 8d8c2410010000 }
            // n = 6, score = 400
            //   83793800             | cmp                 dword ptr [ecx + 0x38], 0
            //   7503                 | jne                 5
            //   83c804               | or                  eax, 4
            //   6a00                 | push                0
            //   e8????????           |                     
            //   8d8c2410010000       | lea                 ecx, dword ptr [esp + 0x110]

        $sequence_5 = { 50 8d8c24f8000000 e8???????? c68424c801000009 8bce e8???????? 6a01 }
            // n = 7, score = 400
            //   50                   | push                eax
            //   8d8c24f8000000       | lea                 ecx, dword ptr [esp + 0xf8]
            //   e8????????           |                     
            //   c68424c801000009     | mov                 byte ptr [esp + 0x1c8], 9
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   6a01                 | push                1

        $sequence_6 = { 8b4508 8bc8 83e01f c1f905 8b0c8d60ae4700 c1e006 8d44010c }
            // n = 7, score = 400
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8bc8                 | mov                 ecx, eax
            //   83e01f               | and                 eax, 0x1f
            //   c1f905               | sar                 ecx, 5
            //   8b0c8d60ae4700       | mov                 ecx, dword ptr [ecx*4 + 0x47ae60]
            //   c1e006               | shl                 eax, 6
            //   8d44010c             | lea                 eax, dword ptr [ecx + eax + 0xc]

        $sequence_7 = { 7410 3d9a020000 7409 5f b8feffffff 5b 5d }
            // n = 7, score = 400
            //   7410                 | je                  0x12
            //   3d9a020000           | cmp                 eax, 0x29a
            //   7409                 | je                  0xb
            //   5f                   | pop                 edi
            //   b8feffffff           | mov                 eax, 0xfffffffe
            //   5b                   | pop                 ebx
            //   5d                   | pop                 ebp

        $sequence_8 = { 0fb6b188574600 8b4d0c 0fb77cb102 8b88bc160000 bb10000000 2bdf 897df0 }
            // n = 7, score = 400
            //   0fb6b188574600       | movzx               esi, byte ptr [ecx + 0x465788]
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   0fb77cb102           | movzx               edi, word ptr [ecx + esi*4 + 2]
            //   8b88bc160000         | mov                 ecx, dword ptr [eax + 0x16bc]
            //   bb10000000           | mov                 ebx, 0x10
            //   2bdf                 | sub                 ebx, edi
            //   897df0               | mov                 dword ptr [ebp - 0x10], edi

        $sequence_9 = { e8???????? c68424cc00000003 83ec1c 8bcc 8964244c 51 }
            // n = 6, score = 400
            //   e8????????           |                     
            //   c68424cc00000003     | mov                 byte ptr [esp + 0xcc], 3
            //   83ec1c               | sub                 esp, 0x1c
            //   8bcc                 | mov                 ecx, esp
            //   8964244c             | mov                 dword ptr [esp + 0x4c], esp
            //   51                   | push                ecx

    condition:
        7 of them and filesize < 1076224
}