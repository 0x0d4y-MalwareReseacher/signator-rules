rule win_m0yv_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.m0yv."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.m0yv"
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
        $sequence_0 = { 4803ac24c0000000 48896c2458 4c8b5c2418 4b8d0c1b 48890c24 480fafc1 488d3cc0 }
            // n = 7, score = 100
            //   4803ac24c0000000     | dec                 eax
            //   48896c2458           | mov                 dword ptr [esp + 0x28], ecx
            //   4c8b5c2418           | mov                 dword ptr [esp + 0x20], edx
            //   4b8d0c1b             | dec                 esp
            //   48890c24             | lea                 ecx, [0xffff8800]
            //   480fafc1             | dec                 esp
            //   488d3cc0             | mov                 eax, dword ptr [ebp + 0x70]

        $sequence_1 = { f6c104 7476 410fb6c2 420fb6441803 448bc0 8bd0 }
            // n = 6, score = 100
            //   f6c104               | sar                 ebx, 0x15
            //   7476                 | dec                 esp
            //   410fb6c2             | sub                 eax, ebx
            //   420fb6441803         | dec                 eax
            //   448bc0               | mov                 dword ptr [esp + 0x40], eax
            //   8bd0                 | dec                 esp

        $sequence_2 = { 48897820 4156 4883ec20 8a99a6000000 4032f6 4032ff 4032ed }
            // n = 7, score = 100
            //   48897820             | mov                 edx, edi
            //   4156                 | mov                 esi, 9
            //   4883ec20             | nop                 dword ptr [eax + eax]
            //   8a99a6000000         | dec                 eax
            //   4032f6               | mov                 ecx, edi
            //   4032ff               | dec                 eax
            //   4032ed               | mov                 edx, edi

        $sequence_3 = { 4869fa53c6f0ff 4801f8 4869ed132c0a00 488bbc24c0000000 4c8d3c2f 4801fd 4881c500001000 }
            // n = 7, score = 100
            //   4869fa53c6f0ff       | dec                 eax
            //   4801f8               | lea                 ecx, [edi + 0x1a]
            //   4869ed132c0a00       | shr                 eax, 2
            //   488bbc24c0000000     | shr                 eax, 5
            //   4c8d3c2f             | and                 eax, 0x1fffff
            //   4801fd               | dec                 eax
            //   4881c500001000       | mov                 dword ptr [esp + 0xa0], eax

        $sequence_4 = { 4889f2 4989d8 e8???????? 488d8c2480000000 e8???????? 488dbc2410010000 }
            // n = 6, score = 100
            //   4889f2               | jne                 0x1cf4
            //   4989d8               | movaps              xmm6, xmmword ptr [esp + 0x1400]
            //   e8????????           |                     
            //   488d8c2480000000     | movaps              xmm7, xmmword ptr [esp + 0x1410]
            //   e8????????           |                     
            //   488dbc2410010000     | inc                 ecx

        $sequence_5 = { 48c1fb15 4c01f3 4989de 49c1fe15 4d01e6 4d89f0 49c1f815 }
            // n = 7, score = 100
            //   48c1fb15             | xor                 eax, esi
            //   4c01f3               | inc                 esp
            //   4989de               | xor                 ecx, dword ptr [esp + 0x24]
            //   49c1fe15             | inc                 esp
            //   4d01e6               | mov                 dword ptr [edx], ecx
            //   4d89f0               | inc                 esp
            //   49c1f815             | xor                 edx, dword ptr [esp + 0x28]

        $sequence_6 = { 480faf4c2448 4801cd 4803ac24c0000000 48896c2458 4c8b5c2418 }
            // n = 5, score = 100
            //   480faf4c2448         | movzx               edx, byte ptr [ecx + 0x53]
            //   4801cd               | inc                 ebp
            //   4803ac24c0000000     | xor                 eax, eax
            //   48896c2458           | dec                 eax
            //   4c8b5c2418           | mov                 esi, ecx

        $sequence_7 = { 488b942490000000 4c8d3c02 4801d0 480500001000 4989c6 48250000e0ff 4929c7 }
            // n = 7, score = 100
            //   488b942490000000     | and                 dl, bl
            //   4c8d3c02             | inc                 ebp
            //   4801d0               | mov                 byte ptr [ecx + 0x24], al
            //   480500001000         | inc                 ecx
            //   4989c6               | mov                 byte ptr [ecx + 0x28], dl
            //   48250000e0ff         | mov                 edx, eax
            //   4929c7               | shr                 edx, 5

        $sequence_8 = { 31c3 8b4118 89442410 8b7218 8974243c 31c6 8b411c }
            // n = 7, score = 100
            //   31c3                 | nop                 
            //   8b4118               | mov                 ebx, dword ptr [ecx + eax*4]
            //   89442410             | dec                 ebp
            //   8b7218               | test                esp, esp
            //   8974243c             | je                  0xbd2
            //   31c6                 | test                eax, eax
            //   8b411c               | je                  0xbd2

        $sequence_9 = { 8b7c2404 4431d7 897904 8b7c2408 4431df 897908 8b7c241c }
            // n = 7, score = 100
            //   8b7c2404             | dec                 esp
            //   4431d7               | mov                 ecx, esi
            //   897904               | dec                 esp
            //   8b7c2408             | mov                 esi, dword ptr [esp + 0x38]
            //   4431df               | dec                 ecx
            //   897908               | imul                ecx, ecx
            //   8b7c241c             | dec                 eax

    condition:
        7 of them and filesize < 779264
}