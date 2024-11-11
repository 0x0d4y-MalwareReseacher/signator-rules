rule win_juicy_potato_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.juicy_potato."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.juicy_potato"
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
        $sequence_0 = { 488d15f58effff e8???????? 8d4701 8903 8b0b 8b4304 }
            // n = 6, score = 100
            //   488d15f58effff       | jne                 0x26
            //   e8????????           |                     
            //   8d4701               | dec                 ebp
            //   8903                 | mov                 ecx, dword ptr [eax]
            //   8b0b                 | dec                 eax
            //   8b4304               | lea                 edx, [0xffff6461]

        $sequence_1 = { 488b742460 488b7c2468 4883c440 415e c3 488d151af80100 }
            // n = 6, score = 100
            //   488b742460           | je                  0x8b
            //   488b7c2468           | and                 dword ptr [esp + 0x28], 0
            //   4883c440             | dec                 eax
            //   415e                 | lea                 eax, [0xfffeee45]
            //   c3                   | dec                 ecx
            //   488d151af80100       | mov                 dword ptr [ebx - 0x18], eax

        $sequence_2 = { 488b13 4983c8ff 660f1f440000 49ffc0 6642390442 75f6 488d0dbffe0400 }
            // n = 7, score = 100
            //   488b13               | mov                 dword ptr [ebp + 0xc], eax
            //   4983c8ff             | mov                 dword ptr [ebp + 0x14], 2
            //   660f1f440000         | dec                 eax
            //   49ffc0               | mov                 dword ptr [esp + 0x28], esi
            //   6642390442           | jmp                 0x430
            //   75f6                 | mov                 dword ptr [ebp + 0x18], 1
            //   488d0dbffe0400       | dec                 eax

        $sequence_3 = { 49ffc0 6642390442 75f6 488d0dbffe0400 e8???????? eb2e ffcf }
            // n = 7, score = 100
            //   49ffc0               | dec                 eax
            //   6642390442           | mov                 dword ptr [esp + 8], ebx
            //   75f6                 | push                edi
            //   488d0dbffe0400       | dec                 eax
            //   e8????????           |                     
            //   eb2e                 | sub                 esp, 0x50
            //   ffcf                 | dec                 eax

        $sequence_4 = { 7411 488d05048c0400 483bc8 7405 }
            // n = 4, score = 100
            //   7411                 | mov                 dword ptr [ecx], eax
            //   488d05048c0400       | dec                 eax
            //   483bc8               | mov                 eax, ecx
            //   7405                 | ret                 

        $sequence_5 = { 4983e801 75e3 4d63ee 498bcd c7459f005d0000 c745a30000000a c745a700ffff00 }
            // n = 7, score = 100
            //   4983e801             | mov                 dword ptr [esp + 8], ebx
            //   75e3                 | dec                 eax
            //   4d63ee               | mov                 dword ptr [esp + 0x10], ebp
            //   498bcd               | dec                 eax
            //   c7459f005d0000       | mov                 dword ptr [esp + 0x18], esi
            //   c745a30000000a       | push                edi
            //   c745a700ffff00       | dec                 eax

        $sequence_6 = { 7427 488b4c2438 488d15f6ee0200 ff15???????? 488bd8 4885c0 }
            // n = 6, score = 100
            //   7427                 | jmp                 0x5ba
            //   488b4c2438           | dec                 ecx
            //   488d15f6ee0200       | mov                 eax, esp
            //   ff15????????         |                     
            //   488bd8               | dec                 eax
            //   4885c0               | lea                 ecx, [eax + 8]

        $sequence_7 = { 4c8bf1 8360b800 4c8d0d44880200 4c8d057d880200 33d2 }
            // n = 5, score = 100
            //   4c8bf1               | dec                 eax
            //   8360b800             | lea                 eax, [0x34b01]
            //   4c8d0d44880200       | dec                 eax
            //   4c8d057d880200       | mov                 dword ptr [edx], ecx
            //   33d2                 | dec                 eax

        $sequence_8 = { 8360b800 4c8d0d44880200 4c8d057d880200 33d2 488bcb e8???????? 488bf8 }
            // n = 7, score = 100
            //   8360b800             | mov                 dword ptr [esp + 0x30], ebx
            //   4c8d0d44880200       | and                 dword ptr [esp + 0x20], 0
            //   4c8d057d880200       | dec                 ecx
            //   33d2                 | cmp                 dword ptr [eax + 0x10], 0
            //   488bcb               | je                  0x1474
            //   e8????????           |                     
            //   488bf8               | inc                 ecx

        $sequence_9 = { 488d8d24030000 898520030000 e8???????? 488d0dc1c0feff 48c1e602 0fb784b950fc0300 488d9140f30300 }
            // n = 7, score = 100
            //   488d8d24030000       | mov                 edi, eax
            //   898520030000         | dec                 eax
            //   e8????????           |                     
            //   488d0dc1c0feff       | mov                 dword ptr [eax + 0x10], ecx
            //   48c1e602             | dec                 eax
            //   0fb784b950fc0300     | mov                 dword ptr [eax + 0x18], ecx
            //   488d9140f30300       | dec                 eax

    condition:
        7 of them and filesize < 736256
}