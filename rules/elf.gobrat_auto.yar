rule elf_gobrat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects elf.gobrat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/elf.gobrat"
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
        $sequence_0 = { e8???????? 4889fa e9???????? 488d842400010000 488d1d22cf1700 b90b000000 488bbc2420020000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   4889fa               | mov                 dword ptr [esp + 0x88], eax
            //   e9????????           |                     
            //   488d842400010000     | dec                 eax
            //   488d1d22cf1700       | mov                 dword ptr [esp + 0x90], ebx
            //   b90b000000           | nop                 
            //   488bbc2420020000     | dec                 eax

        $sequence_1 = { e8???????? 488b842408010000 488b9c2400010000 488b4c2468 e8???????? e9???????? 4883f917 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   488b842408010000     | dec                 esp
            //   488b9c2400010000     | mov                 edx, dword ptr [edx + 0x48]
            //   488b4c2468           | dec                 esp
            //   e8????????           |                     
            //   e9????????           |                     
            //   4883f917             | mov                 dword ptr [esp + 0x98], edx

        $sequence_2 = { 8d3431 8d76c6 0f1f440000 4883fa06 0f83bf000000 440fb644145c 4131f0 }
            // n = 7, score = 100
            //   8d3431               | dec                 ecx
            //   8d76c6               | adc                 ebx, edx
            //   0f1f440000           | dec                 esp
            //   4883fa06             | mov                 dword ptr [esp + 0x158], ebx
            //   0f83bf000000         | dec                 esp
            //   440fb644145c         | mov                 ebx, dword ptr [esp + 0x288]
            //   4131f0               | dec                 ebp

        $sequence_3 = { e8???????? 488b5c2460 e8???????? 488b6c2448 4883c450 c3 4889442408 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   488b5c2460           | add                 ecx, 2
            //   e8????????           |                     
            //   488b6c2448           | dec                 ecx
            //   4883c450             | cmp                 ecx, 2
            //   c3                   | jge                 0x70d
            //   4889442408           | dec                 eax

        $sequence_4 = { e8???????? 488d3d2cd23b00 e8???????? 488b6c2478 4883ec80 c3 4889ca }
            // n = 7, score = 100
            //   e8????????           |                     
            //   488d3d2cd23b00       | neg                 esi
            //   e8????????           |                     
            //   488b6c2478           | dec                 esp
            //   4883ec80             | sub                 esi, eax
            //   c3                   | dec                 eax
            //   4889ca               | mov                 dword ptr [esp + 0x458], esi

        $sequence_5 = { ebd5 31f6 90 e8???????? ebcb 498b5010 4839d1 }
            // n = 7, score = 100
            //   ebd5                 | dec                 esp
            //   31f6                 | mov                 ecx, dword ptr [esp + 0x670]
            //   90                   | dec                 esp
            //   e8????????           |                     
            //   ebcb                 | mov                 ebp, dword ptr [esp + 0x6e0]
            //   498b5010             | dec                 ebp
            //   4839d1               | adc                 ecx, ebp

        $sequence_6 = { e8???????? 488b442430 48ffc0 488b5c2420 4883c3fe 488b9424a8010000 488bb42458010000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   488b442430           | mov                 ecx, esp
            //   48ffc0               | cmp                 byte ptr [eax], 0
            //   488b5c2420           | dec                 esp
            //   4883c3fe             | mov                 esp, dword ptr [edx]
            //   488b9424a8010000     | dec                 eax
            //   488bb42458010000     | mov                 eax, ebx

        $sequence_7 = { f20f10442428 f20f5e05???????? f20f114040 488b542450 6690 4883fa08 7e3f }
            // n = 7, score = 100
            //   f20f10442428         | dec                 ecx
            //   f20f5e05????????     |                     
            //   f20f114040           | add                 edi, esi
            //   488b542450           | dec                 eax
            //   6690                 | mov                 esi, dword ptr [esp + 0x2f0]
            //   4883fa08             | dec                 ebp
            //   7e3f                 | adc                 eax, edi

        $sequence_8 = { e8???????? 6690 4885c9 0f8578010000 488d0d90371500 4839c8 7505 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   6690                 | sbb                 ebp, -1
            //   4885c9               | dec                 esp
            //   0f8578010000         | mov                 edx, dword ptr [esp + 0x150]
            //   488d0d90371500       | dec                 esp
            //   4839c8               | mov                 dword ptr [esp + 0x298], edx
            //   7505                 | dec                 esp

        $sequence_9 = { e8???????? 488b6d00 488d05225c0500 488d4c2470 e8???????? 31c0 eb28 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   488b6d00             | mov                 ebx, dword ptr [esp + 0x40]
            //   488d05225c0500       | dec                 esp
            //   488d4c2470           | lea                 ebp, [esp + 0x18]
            //   e8????????           |                     
            //   31c0                 | nop                 dword ptr [eax + eax]
            //   eb28                 | dec                 ebp

    condition:
        7 of them and filesize < 12853248
}