rule win_moriagent_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.moriagent."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.moriagent"
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
        $sequence_0 = { b802000000 eb05 b801000000 33ff }
            // n = 4, score = 200
            //   b802000000           | mov                 eax, 2
            //   eb05                 | jmp                 7
            //   b801000000           | mov                 eax, 1
            //   33ff                 | xor                 edi, edi

        $sequence_1 = { b801000000 33ff 4403f8 48ffc5 }
            // n = 4, score = 100
            //   b801000000           | mov                 dword ptr [esp + 0x60], ecx
            //   33ff                 | dec                 eax
            //   4403f8               | lea                 ecx, [ebp + 0x38]
            //   48ffc5               | mov                 eax, 1

        $sequence_2 = { b801000000 4883c428 c3 33c0 4883c428 c3 488139ffffff7f }
            // n = 7, score = 100
            //   b801000000           | dec                 esp
            //   4883c428             | cmp                 edi, edx
            //   c3                   | mov                 eax, 1
            //   33c0                 | inc                 esp
            //   4883c428             | cmove               ebp, eax
            //   c3                   | inc                 esp
            //   488139ffffff7f       | mov                 dword ptr [esp + 0x58], ebp

        $sequence_3 = { b801000000 440f44e8 44896c2458 4c3bfa }
            // n = 4, score = 100
            //   b801000000           | inc                 ebp
            //   440f44e8             | mov                 eax, 1
            //   44896c2458           | xor                 edi, edi
            //   4c3bfa               | inc                 esp

        $sequence_4 = { 895dfc 83ea04 73ec 83fafc }
            // n = 4, score = 100
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   83ea04               | sub                 edx, 4
            //   73ec                 | jae                 0xffffffee
            //   83fafc               | cmp                 edx, -4

        $sequence_5 = { 2bd0 0f1f4000 8a040a 8d4901 }
            // n = 4, score = 100
            //   2bd0                 | sub                 edx, eax
            //   0f1f4000             | nop                 dword ptr [eax]
            //   8a040a               | mov                 al, byte ptr [edx + ecx]
            //   8d4901               | lea                 ecx, [ecx + 1]

        $sequence_6 = { b801000000 0f44c8 894c2460 488d4d38 }
            // n = 4, score = 100
            //   b801000000           | cmp                 ecx, edx
            //   0f44c8               | setbe               al
            //   894c2460             | mov                 eax, 0x80000000
            //   488d4d38             | dec                 eax

        $sequence_7 = { 0f43c2 8d7d98 8945d4 0f43ca 8b45a8 }
            // n = 5, score = 100
            //   0f43c2               | cmovae              eax, edx
            //   8d7d98               | lea                 edi, [ebp - 0x68]
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax
            //   0f43ca               | cmovae              ecx, edx
            //   8b45a8               | mov                 eax, dword ptr [ebp - 0x58]

        $sequence_8 = { 29b5d0eeffff 8bc2 8bb5d0eeffff 2bc1 3bc6 0f42f0 }
            // n = 6, score = 100
            //   29b5d0eeffff         | sub                 dword ptr [ebp - 0x1130], esi
            //   8bc2                 | mov                 eax, edx
            //   8bb5d0eeffff         | mov                 esi, dword ptr [ebp - 0x1130]
            //   2bc1                 | sub                 eax, ecx
            //   3bc6                 | cmp                 eax, esi
            //   0f42f0               | cmovb               esi, eax

        $sequence_9 = { 8d4db0 e8???????? 83c404 c645fc05 8b95f8feffff 83fa10 722f }
            // n = 7, score = 100
            //   8d4db0               | lea                 ecx, [ebp - 0x50]
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   c645fc05             | mov                 byte ptr [ebp - 4], 5
            //   8b95f8feffff         | mov                 edx, dword ptr [ebp - 0x108]
            //   83fa10               | cmp                 edx, 0x10
            //   722f                 | jb                  0x31

        $sequence_10 = { b800000041 3bd1 7c26 412bd1 418d41ff 4863c8 488b83b0000000 }
            // n = 7, score = 100
            //   b800000041           | mov                 eax, 0x41000000
            //   3bd1                 | cmp                 edx, ecx
            //   7c26                 | jl                  0x28
            //   412bd1               | inc                 ecx
            //   418d41ff             | sub                 edx, ecx
            //   4863c8               | inc                 ecx
            //   488b83b0000000       | lea                 eax, [ecx - 1]

        $sequence_11 = { b800000080 4803c8 baffffffff 33c0 }
            // n = 4, score = 100
            //   b800000080           | dec                 eax
            //   4803c8               | arpl                ax, cx
            //   baffffffff           | dec                 eax
            //   33c0                 | mov                 eax, dword ptr [ebx + 0xb0]

        $sequence_12 = { ba1d000000 e9???????? 833d????????00 0f852c520000 8d0d20e44100 ba1d000000 }
            // n = 6, score = 100
            //   ba1d000000           | mov                 edx, 0x1d
            //   e9????????           |                     
            //   833d????????00       |                     
            //   0f852c520000         | jne                 0x5232
            //   8d0d20e44100         | lea                 ecx, [0x41e420]
            //   ba1d000000           | mov                 edx, 0x1d

        $sequence_13 = { b801000000 448d4102 413bc0 7752 ffc8 488d0d77140000 }
            // n = 6, score = 100
            //   b801000000           | dec                 eax
            //   448d4102             | inc                 ebp
            //   413bc0               | dec                 ecx
            //   7752                 | sub                 esi, 1
            //   ffc8                 | jne                 0xffffff5e
            //   488d0d77140000       | inc                 ecx

        $sequence_14 = { c60200 e8???????? 8b0f 8b5704 }
            // n = 4, score = 100
            //   c60200               | mov                 byte ptr [edx], 0
            //   e8????????           |                     
            //   8b0f                 | mov                 ecx, dword ptr [edi]
            //   8b5704               | mov                 edx, dword ptr [edi + 4]

    condition:
        7 of them and filesize < 1347904
}