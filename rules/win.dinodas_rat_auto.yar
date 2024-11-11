rule win_dinodas_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.dinodas_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dinodas_rat"
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
        $sequence_0 = { 8d4598 e9???????? 8d75d4 e9???????? 8d75b8 e9???????? 8b542408 }
            // n = 7, score = 100
            //   8d4598               | lea                 eax, [ebp - 0x68]
            //   e9????????           |                     
            //   8d75d4               | lea                 esi, [ebp - 0x2c]
            //   e9????????           |                     
            //   8d75b8               | lea                 esi, [ebp - 0x48]
            //   e9????????           |                     
            //   8b542408             | mov                 edx, dword ptr [esp + 8]

        $sequence_1 = { 83c404 8b8c240c0c0000 5f 5e 5b 33cc 33c0 }
            // n = 7, score = 100
            //   83c404               | add                 esp, 4
            //   8b8c240c0c0000       | mov                 ecx, dword ptr [esp + 0xc0c]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   33cc                 | xor                 ecx, esp
            //   33c0                 | xor                 eax, eax

        $sequence_2 = { 8b5010 8965b0 8965b0 ffd2 837efc00 8d4efc }
            // n = 6, score = 100
            //   8b5010               | mov                 edx, dword ptr [eax + 0x10]
            //   8965b0               | mov                 dword ptr [ebp - 0x50], esp
            //   8965b0               | mov                 dword ptr [ebp - 0x50], esp
            //   ffd2                 | call                edx
            //   837efc00             | cmp                 dword ptr [esi - 4], 0
            //   8d4efc               | lea                 ecx, [esi - 4]

        $sequence_3 = { 33c0 c745e80f000000 8945e4 8845d4 33db 8b5604 8b75cc }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   c745e80f000000       | mov                 dword ptr [ebp - 0x18], 0xf
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   8845d4               | mov                 byte ptr [ebp - 0x2c], al
            //   33db                 | xor                 ebx, ebx
            //   8b5604               | mov                 edx, dword ptr [esi + 4]
            //   8b75cc               | mov                 esi, dword ptr [ebp - 0x34]

        $sequence_4 = { 0bca 7d09 8bc7 8bcb e8???????? 8b450c 8b1b }
            // n = 7, score = 100
            //   0bca                 | or                  ecx, edx
            //   7d09                 | jge                 0xb
            //   8bc7                 | mov                 eax, edi
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   8b1b                 | mov                 ebx, dword ptr [ebx]

        $sequence_5 = { 8dbd9cfdffff e8???????? 8b959cfdffff 8b4af4 8b8590fdffff 83c120 0108 }
            // n = 7, score = 100
            //   8dbd9cfdffff         | lea                 edi, [ebp - 0x264]
            //   e8????????           |                     
            //   8b959cfdffff         | mov                 edx, dword ptr [ebp - 0x264]
            //   8b4af4               | mov                 ecx, dword ptr [edx - 0xc]
            //   8b8590fdffff         | mov                 eax, dword ptr [ebp - 0x270]
            //   83c120               | add                 ecx, 0x20
            //   0108                 | add                 dword ptr [eax], ecx

        $sequence_6 = { ff2485769c4200 33c0 838df4fbffffff 898598fbffff 8985b0fbffff 8985d8fbffff 8985dcfbffff }
            // n = 7, score = 100
            //   ff2485769c4200       | jmp                 dword ptr [eax*4 + 0x429c76]
            //   33c0                 | xor                 eax, eax
            //   838df4fbffffff       | or                  dword ptr [ebp - 0x40c], 0xffffffff
            //   898598fbffff         | mov                 dword ptr [ebp - 0x468], eax
            //   8985b0fbffff         | mov                 dword ptr [ebp - 0x450], eax
            //   8985d8fbffff         | mov                 dword ptr [ebp - 0x428], eax
            //   8985dcfbffff         | mov                 dword ptr [ebp - 0x424], eax

        $sequence_7 = { 57 50 8d45f4 64a300000000 8bf1 33ff 8bc6 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   50                   | push                eax
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   8bf1                 | mov                 esi, ecx
            //   33ff                 | xor                 edi, edi
            //   8bc6                 | mov                 eax, esi

        $sequence_8 = { e8???????? c645fc01 8b45d4 33db 837de810 895dd0 7303 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   8b45d4               | mov                 eax, dword ptr [ebp - 0x2c]
            //   33db                 | xor                 ebx, ebx
            //   837de810             | cmp                 dword ptr [ebp - 0x18], 0x10
            //   895dd0               | mov                 dword ptr [ebp - 0x30], ebx
            //   7303                 | jae                 5

        $sequence_9 = { 89442428 8d4c2420 51 8d542414 68???????? 52 c644247402 }
            // n = 7, score = 100
            //   89442428             | mov                 dword ptr [esp + 0x28], eax
            //   8d4c2420             | lea                 ecx, [esp + 0x20]
            //   51                   | push                ecx
            //   8d542414             | lea                 edx, [esp + 0x14]
            //   68????????           |                     
            //   52                   | push                edx
            //   c644247402           | mov                 byte ptr [esp + 0x74], 2

    condition:
        7 of them and filesize < 638976
}