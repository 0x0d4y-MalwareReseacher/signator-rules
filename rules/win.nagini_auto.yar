rule win_nagini_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.nagini."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nagini"
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
        $sequence_0 = { 06 2418 06 291c06 26180523140423 1306 2515082616 }
            // n = 7, score = 100
            //   06                   | push                es
            //   2418                 | and                 al, 0x18
            //   06                   | push                es
            //   291c06               | sub                 dword ptr [esi + eax], ebx
            //   26180523140423       | sbb                 byte ptr es:[0x23041423], al
            //   1306                 | adc                 eax, dword ptr [esi]
            //   2515082616           | and                 eax, 0x16260815

        $sequence_1 = { e9???????? 6683f803 0f85c1020000 6804010000 8d842474010000 33f6 50 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   6683f803             | cmp                 ax, 3
            //   0f85c1020000         | jne                 0x2c7
            //   6804010000           | push                0x104
            //   8d842474010000       | lea                 eax, [esp + 0x174]
            //   33f6                 | xor                 esi, esi
            //   50                   | push                eax

        $sequence_2 = { 0305???????? 0305???????? 0305???????? 0404 0404 0404 }
            // n = 6, score = 100
            //   0305????????         |                     
            //   0305????????         |                     
            //   0305????????         |                     
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4

        $sequence_3 = { b0a9 95 b3ac 98 b7b0 9c }
            // n = 6, score = 100
            //   b0a9                 | mov                 al, 0xa9
            //   95                   | xchg                eax, ebp
            //   b3ac                 | mov                 bl, 0xac
            //   98                   | cwde                
            //   b7b0                 | mov                 bh, 0xb0
            //   9c                   | pushfd              

        $sequence_4 = { 081c10 0c1e 120e 1c10 0c1c }
            // n = 5, score = 100
            //   081c10               | or                  byte ptr [eax + edx], bl
            //   0c1e                 | or                  al, 0x1e
            //   120e                 | adc                 cl, byte ptr [esi]
            //   1c10                 | sbb                 al, 0x10
            //   0c1c                 | or                  al, 0x1c

        $sequence_5 = { 83ec14 53 56 57 8b3d???????? 8bd9 6a00 }
            // n = 7, score = 100
            //   83ec14               | sub                 esp, 0x14
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b3d????????         |                     
            //   8bd9                 | mov                 ebx, ecx
            //   6a00                 | push                0

        $sequence_6 = { 6a00 ff7508 ff15???????? ff7508 ff15???????? eb28 68???????? }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   eb28                 | jmp                 0x2a
            //   68????????           |                     

        $sequence_7 = { 1209 17 1308 1b17 0c1f 1b10 201a }
            // n = 7, score = 100
            //   1209                 | adc                 cl, byte ptr [ecx]
            //   17                   | pop                 ss
            //   1308                 | adc                 ecx, dword ptr [eax]
            //   1b17                 | sbb                 edx, dword ptr [edi]
            //   0c1f                 | or                  al, 0x1f
            //   1b10                 | sbb                 edx, dword ptr [eax]
            //   201a                 | and                 byte ptr [edx], bl

        $sequence_8 = { 2c4a 3c30 4d 3f 335143 37 }
            // n = 6, score = 100
            //   2c4a                 | sub                 al, 0x4a
            //   3c30                 | cmp                 al, 0x30
            //   4d                   | dec                 ebp
            //   3f                   | aas                 
            //   335143               | xor                 edx, dword ptr [ecx + 0x43]
            //   37                   | aaa                 

        $sequence_9 = { 6804010000 8d842474010000 33f6 50 6a02 53 33ff }
            // n = 7, score = 100
            //   6804010000           | push                0x104
            //   8d842474010000       | lea                 eax, [esp + 0x174]
            //   33f6                 | xor                 esi, esi
            //   50                   | push                eax
            //   6a02                 | push                2
            //   53                   | push                ebx
            //   33ff                 | xor                 edi, edi

    condition:
        7 of them and filesize < 12820480
}