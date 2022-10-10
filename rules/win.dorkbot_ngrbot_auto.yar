rule win_dorkbot_ngrbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.dorkbot_ngrbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dorkbot_ngrbot"
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
        $sequence_0 = { 8b0d???????? 8b11 8b3d???????? 8b4104 8d1c3a 03f8 85d2 }
            // n = 7, score = 200
            //   8b0d????????         |                     
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   8b3d????????         |                     
            //   8b4104               | mov                 eax, dword ptr [ecx + 4]
            //   8d1c3a               | lea                 ebx, [edx + edi]
            //   03f8                 | add                 edi, eax
            //   85d2                 | test                edx, edx

        $sequence_1 = { 57 8d78f8 85f6 7453 85c0 }
            // n = 5, score = 200
            //   57                   | push                edi
            //   8d78f8               | lea                 edi, [eax - 8]
            //   85f6                 | test                esi, esi
            //   7453                 | je                  0x55
            //   85c0                 | test                eax, eax

        $sequence_2 = { 393cb584563a02 8d0cb584563a02 75d4 5f 5e c3 8bc7 }
            // n = 7, score = 200
            //   393cb584563a02       | cmp                 dword ptr [esi*4 + 0x23a5684], edi
            //   8d0cb584563a02       | lea                 ecx, [esi*4 + 0x23a5684]
            //   75d4                 | jne                 0xffffffd6
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   8bc7                 | mov                 eax, edi

        $sequence_3 = { 68???????? 6a00 6a00 ff15???????? 50 ffd3 8b4610 }
            // n = 7, score = 200
            //   68????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   50                   | push                eax
            //   ffd3                 | call                ebx
            //   8b4610               | mov                 eax, dword ptr [esi + 0x10]

        $sequence_4 = { 68???????? 8d95fcfeffff 6803010000 52 e8???????? 6a00 6a20 }
            // n = 7, score = 200
            //   68????????           |                     
            //   8d95fcfeffff         | lea                 edx, [ebp - 0x104]
            //   6803010000           | push                0x103
            //   52                   | push                edx
            //   e8????????           |                     
            //   6a00                 | push                0
            //   6a20                 | push                0x20

        $sequence_5 = { 33db 03c8 395e40 7632 8b3a }
            // n = 5, score = 200
            //   33db                 | xor                 ebx, ebx
            //   03c8                 | add                 ecx, eax
            //   395e40               | cmp                 dword ptr [esi + 0x40], ebx
            //   7632                 | jbe                 0x34
            //   8b3a                 | mov                 edi, dword ptr [edx]

        $sequence_6 = { 74de 84c0 74da 4b 85db 7fd5 c6443efe0d }
            // n = 7, score = 200
            //   74de                 | je                  0xffffffe0
            //   84c0                 | test                al, al
            //   74da                 | je                  0xffffffdc
            //   4b                   | dec                 ebx
            //   85db                 | test                ebx, ebx
            //   7fd5                 | jg                  0xffffffd7
            //   c6443efe0d           | mov                 byte ptr [esi + edi - 2], 0xd

        $sequence_7 = { 03f0 8a8435fffdffff 3c0d 7413 3c0a 740f 57 }
            // n = 7, score = 200
            //   03f0                 | add                 esi, eax
            //   8a8435fffdffff       | mov                 al, byte ptr [ebp + esi - 0x201]
            //   3c0d                 | cmp                 al, 0xd
            //   7413                 | je                  0x15
            //   3c0a                 | cmp                 al, 0xa
            //   740f                 | je                  0x11
            //   57                   | push                edi

        $sequence_8 = { 53 8d55d4 52 ffd6 85c0 7fdb 5f }
            // n = 7, score = 200
            //   53                   | push                ebx
            //   8d55d4               | lea                 edx, [ebp - 0x2c]
            //   52                   | push                edx
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   7fdb                 | jg                  0xffffffdd
            //   5f                   | pop                 edi

        $sequence_9 = { eb13 6a00 8d45fc 50 51 ff15???????? 8b9620693a02 }
            // n = 7, score = 200
            //   eb13                 | jmp                 0x15
            //   6a00                 | push                0
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8b9620693a02         | mov                 edx, dword ptr [esi + 0x23a6920]

    condition:
        7 of them and filesize < 638976
}