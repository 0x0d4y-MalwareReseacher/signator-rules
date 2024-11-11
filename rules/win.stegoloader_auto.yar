rule win_stegoloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.stegoloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.stegoloader"
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
        $sequence_0 = { 85c0 7c2e 6a10 e8???????? 3bc3 }
            // n = 5, score = 200
            //   85c0                 | test                eax, eax
            //   7c2e                 | jl                  0x30
            //   6a10                 | push                0x10
            //   e8????????           |                     
            //   3bc3                 | cmp                 eax, ebx

        $sequence_1 = { 56 33db 53 ff742414 8bf1 8b06 ff5004 }
            // n = 7, score = 200
            //   56                   | push                esi
            //   33db                 | xor                 ebx, ebx
            //   53                   | push                ebx
            //   ff742414             | push                dword ptr [esp + 0x14]
            //   8bf1                 | mov                 esi, ecx
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   ff5004               | call                dword ptr [eax + 4]

        $sequence_2 = { 59 7430 83c604 85c0 7633 8bd8 }
            // n = 6, score = 200
            //   59                   | pop                 ecx
            //   7430                 | je                  0x32
            //   83c604               | add                 esi, 4
            //   85c0                 | test                eax, eax
            //   7633                 | jbe                 0x35
            //   8bd8                 | mov                 ebx, eax

        $sequence_3 = { 8945f4 8945f8 8945fc 8d45f0 8bf1 50 }
            // n = 6, score = 200
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   8bf1                 | mov                 esi, ecx
            //   50                   | push                eax

        $sequence_4 = { 83ec10 53 33c0 56 50 8945f4 }
            // n = 6, score = 200
            //   83ec10               | sub                 esp, 0x10
            //   53                   | push                ebx
            //   33c0                 | xor                 eax, eax
            //   56                   | push                esi
            //   50                   | push                eax
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax

        $sequence_5 = { 5e 5b c9 c3 56 33c9 }
            // n = 6, score = 200
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   c9                   | leave               
            //   c3                   | ret                 
            //   56                   | push                esi
            //   33c9                 | xor                 ecx, ecx

        $sequence_6 = { c645b44f c645b520 c645b626 c645b726 c645b820 c645b953 c645ba59 }
            // n = 7, score = 200
            //   c645b44f             | mov                 byte ptr [ebp - 0x4c], 0x4f
            //   c645b520             | mov                 byte ptr [ebp - 0x4b], 0x20
            //   c645b626             | mov                 byte ptr [ebp - 0x4a], 0x26
            //   c645b726             | mov                 byte ptr [ebp - 0x49], 0x26
            //   c645b820             | mov                 byte ptr [ebp - 0x48], 0x20
            //   c645b953             | mov                 byte ptr [ebp - 0x47], 0x53
            //   c645ba59             | mov                 byte ptr [ebp - 0x46], 0x59

        $sequence_7 = { c645d845 c645d920 c645da38 c645db2e c645dc30 c645dd3b c645de20 }
            // n = 7, score = 200
            //   c645d845             | mov                 byte ptr [ebp - 0x28], 0x45
            //   c645d920             | mov                 byte ptr [ebp - 0x27], 0x20
            //   c645da38             | mov                 byte ptr [ebp - 0x26], 0x38
            //   c645db2e             | mov                 byte ptr [ebp - 0x25], 0x2e
            //   c645dc30             | mov                 byte ptr [ebp - 0x24], 0x30
            //   c645dd3b             | mov                 byte ptr [ebp - 0x23], 0x3b
            //   c645de20             | mov                 byte ptr [ebp - 0x22], 0x20

        $sequence_8 = { 33c9 83ceff 394c240c 7629 57 8b44240c 0fb61401 }
            // n = 7, score = 200
            //   33c9                 | xor                 ecx, ecx
            //   83ceff               | or                  esi, 0xffffffff
            //   394c240c             | cmp                 dword ptr [esp + 0xc], ecx
            //   7629                 | jbe                 0x2b
            //   57                   | push                edi
            //   8b44240c             | mov                 eax, dword ptr [esp + 0xc]
            //   0fb61401             | movzx               edx, byte ptr [ecx + eax]

        $sequence_9 = { 8a07 83c40c 46 3c43 }
            // n = 4, score = 200
            //   8a07                 | mov                 al, byte ptr [edi]
            //   83c40c               | add                 esp, 0xc
            //   46                   | inc                 esi
            //   3c43                 | cmp                 al, 0x43

        $sequence_10 = { 50 6aff 83c604 895dfc ff55e8 85c0 0f85b5000000 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   6aff                 | push                -1
            //   83c604               | add                 esi, 4
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   ff55e8               | call                dword ptr [ebp - 0x18]
            //   85c0                 | test                eax, eax
            //   0f85b5000000         | jne                 0xbb

        $sequence_11 = { bf00200000 397df8 c645ff00 7303 8b7df8 6a14 }
            // n = 6, score = 200
            //   bf00200000           | mov                 edi, 0x2000
            //   397df8               | cmp                 dword ptr [ebp - 8], edi
            //   c645ff00             | mov                 byte ptr [ebp - 1], 0
            //   7303                 | jae                 5
            //   8b7df8               | mov                 edi, dword ptr [ebp - 8]
            //   6a14                 | push                0x14

        $sequence_12 = { 8bec 83ec14 64a130000000 8945fc 8b45fc }
            // n = 5, score = 200
            //   8bec                 | mov                 ebp, esp
            //   83ec14               | sub                 esp, 0x14
            //   64a130000000         | mov                 eax, dword ptr fs:[0x30]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_13 = { 889c05f1feffff 8d85f0feffff 8945f8 8d4508 }
            // n = 4, score = 200
            //   889c05f1feffff       | mov                 byte ptr [ebp + eax - 0x10f], bl
            //   8d85f0feffff         | lea                 eax, [ebp - 0x110]
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8d4508               | lea                 eax, [ebp + 8]

        $sequence_14 = { 880a 75e9 eb5b 83e803 eb02 }
            // n = 5, score = 200
            //   880a                 | mov                 byte ptr [edx], cl
            //   75e9                 | jne                 0xffffffeb
            //   eb5b                 | jmp                 0x5d
            //   83e803               | sub                 eax, 3
            //   eb02                 | jmp                 4

        $sequence_15 = { 72ef 8b06 8d4df8 51 8bce }
            // n = 5, score = 200
            //   72ef                 | jb                  0xfffffff1
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8d4df8               | lea                 ecx, [ebp - 8]
            //   51                   | push                ecx
            //   8bce                 | mov                 ecx, esi

    condition:
        7 of them and filesize < 802816
}