rule win_pandora_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.pandora."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pandora"
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
        $sequence_0 = { 415d c3 8b894c010000 4889742468 e8???????? 488bf0 4885c0 }
            // n = 7, score = 100
            //   415d                 | je                  0x1b61
            //   c3                   | dec                 eax
            //   8b894c010000         | mov                 eax, dword ptr [ebp - 0x70]
            //   4889742468           | dec                 esp
            //   e8????????           |                     
            //   488bf0               | lea                 eax, [eax*8]
            //   4885c0               | dec                 ebp

        $sequence_1 = { 85c0 7541 895c2438 eb43 4c8d442438 488d542420 e8???????? }
            // n = 7, score = 100
            //   85c0                 | cmp                 eax, 0x3cd69d30
            //   7541                 | setl                dl
            //   895c2438             | dec                 eax
            //   eb43                 | mov                 edx, dword ptr [ecx + edx*8 + 0x128]
            //   4c8d442438           | dec                 esp
            //   488d542420           | add                 edx, esi
            //   e8????????           |                     

        $sequence_2 = { 33d2 448d4228 ffd0 488b4b58 e8???????? 488b4b50 4885c9 }
            // n = 7, score = 100
            //   33d2                 | mov                 byte ptr [edx], 0x30
            //   448d4228             | dec                 ecx
            //   ffd0                 | cmp                 edi, edi
            //   488b4b58             | dec                 eax
            //   e8????????           |                     
            //   488b4b50             | cmp                 eax, 1
            //   4885c9               | jl                  0x1b3c

        $sequence_3 = { 488b7c2440 488d542450 488d4c2438 e8???????? 85c0 0f85e5000000 488d45f0 }
            // n = 7, score = 100
            //   488b7c2440           | inc                 ecx
            //   488d542450           | and                 eax, ebx
            //   488d4c2438           | or                  ecx, eax
            //   e8????????           |                     
            //   85c0                 | add                 esi, 0x7a6d76e9
            //   0f85e5000000         | inc                 ecx
            //   488d45f0             | rol                 eax, 0xa

        $sequence_4 = { 57 4155 4156 488d6c24d0 4881ec30010000 8b01 498bd9 }
            // n = 7, score = 100
            //   57                   | test                edi, edi
            //   4155                 | js                  0x130e
            //   4156                 | dec                 ecx
            //   488d6c24d0           | mov                 ecx, edi
            //   4881ec30010000       | dec                 esp
            //   8b01                 | mov                 edx, esi
            //   498bd9               | dec                 eax

        $sequence_5 = { c1c807 8bca c1ea03 c1c10e 33c8 33ca 4403c9 }
            // n = 7, score = 100
            //   c1c807               | xor                 ebx, dword ptr [esp + 0x2c]
            //   8bca                 | inc                 ecx
            //   c1ea03               | xor                 ecx, ecx
            //   c1c10e               | inc                 ecx
            //   33c8                 | xor                 ecx, edx
            //   33ca                 | rol                 ebx, 1
            //   4403c9               | xor                 ebx, esi

        $sequence_6 = { 49ffc0 4c3bc7 72d2 488bd6 488d4def e8???????? 8bd8 }
            // n = 7, score = 100
            //   49ffc0               | inc                 ecx
            //   4c3bc7               | mov                 eax, ecx
            //   72d2                 | inc                 ecx
            //   488bd6               | add                 ecx, ebx
            //   488d4def             | rol                 edx, 5
            //   e8????????           |                     
            //   8bd8                 | or                  ecx, eax

        $sequence_7 = { 440bc0 0fb602 41c1e008 440bc0 0fb64206 0bc8 4489442430 }
            // n = 7, score = 100
            //   440bc0               | inc                 ecx
            //   0fb602               | mov                 byte ptr [ebp], al
            //   41c1e008             | mov                 eax, edi
            //   440bc0               | dec                 eax
            //   0fb64206             | shl                 eax, 4
            //   0bc8                 | dec                 eax
            //   4489442430           | lea                 ecx, [ebp + 7]

        $sequence_8 = { 33d5 33542420 4133c2 33c3 d1c2 05d6c162ca c1cb02 }
            // n = 7, score = 100
            //   33d5                 | mov                 dword ptr [esp + 0x70], eax
            //   33542420             | mov                 eax, dword ptr [esp + 0x30]
            //   4133c2               | mov                 ecx, 0xa557ee88
            //   33c3                 | add                 eax, ecx
            //   d1c2                 | cmp                 eax, 0xd43fb344
            //   05d6c162ca           | dec                 eax
            //   c1cb02               | mov                 dword ptr [esp + 0x78], eax

        $sequence_9 = { 0f84f7010000 833801 752d 0f1001 498d4b18 660f73d808 66490f7ec0 }
            // n = 7, score = 100
            //   0f84f7010000         | xor                 edx, dword ptr [edi + eax*8 + 0xc]
            //   833801               | inc                 ebp
            //   752d                 | xor                 ebx, dword ptr [edi + eax*8 + 0x10]
            //   0f1001               | inc                 ecx
            //   498d4b18             | mov                 eax, esi
            //   660f73d808           | shr                 eax, 8
            //   66490f7ec0           | inc                 ebp

    condition:
        7 of them and filesize < 1032192
}