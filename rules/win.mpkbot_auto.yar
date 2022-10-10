rule win_mpkbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.mpkbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mpkbot"
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
        $sequence_0 = { c745d803000000 0fb630 8975d4 40 }
            // n = 4, score = 400
            //   c745d803000000       | mov                 dword ptr [ebp - 0x28], 3
            //   0fb630               | movzx               esi, byte ptr [eax]
            //   8975d4               | mov                 dword ptr [ebp - 0x2c], esi
            //   40                   | inc                 eax

        $sequence_1 = { 56 68???????? 8975f4 8b08 }
            // n = 4, score = 400
            //   56                   | push                esi
            //   68????????           |                     
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   8b08                 | mov                 ecx, dword ptr [eax]

        $sequence_2 = { 6a01 6aff 8975fc 8b08 }
            // n = 4, score = 400
            //   6a01                 | push                1
            //   6aff                 | push                -1
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   8b08                 | mov                 ecx, dword ptr [eax]

        $sequence_3 = { 68???????? 68???????? 8975f8 8b08 50 ff5150 }
            // n = 6, score = 400
            //   68????????           |                     
            //   68????????           |                     
            //   8975f8               | mov                 dword ptr [ebp - 8], esi
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   50                   | push                eax
            //   ff5150               | call                dword ptr [ecx + 0x50]

        $sequence_4 = { 663bc1 750d 6a00 6800010000 56 e8???????? 46 }
            // n = 7, score = 400
            //   663bc1               | cmp                 ax, cx
            //   750d                 | jne                 0xf
            //   6a00                 | push                0
            //   6800010000           | push                0x100
            //   56                   | push                esi
            //   e8????????           |                     
            //   46                   | inc                 esi

        $sequence_5 = { c3 55 8bec 33c0 384508 7507 }
            // n = 6, score = 400
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   33c0                 | xor                 eax, eax
            //   384508               | cmp                 byte ptr [ebp + 8], al
            //   7507                 | jne                 9

        $sequence_6 = { 6689500e 33d2 c70028000000 895010 }
            // n = 4, score = 400
            //   6689500e             | mov                 word ptr [eax + 0xe], dx
            //   33d2                 | xor                 edx, edx
            //   c70028000000         | mov                 dword ptr [eax], 0x28
            //   895010               | mov                 dword ptr [eax + 0x10], edx

        $sequence_7 = { 55 8bec 33c0 384508 7507 38450c }
            // n = 6, score = 400
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   33c0                 | xor                 eax, eax
            //   384508               | cmp                 byte ptr [ebp + 8], al
            //   7507                 | jne                 9
            //   38450c               | cmp                 byte ptr [ebp + 0xc], al

        $sequence_8 = { 50 ff15???????? ff7510 a3???????? ff750c ff7508 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   ff15????????         |                     
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   a3????????           |                     
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_9 = { 6a00 ff15???????? 8bf0 0fb7450c 50 }
            // n = 5, score = 400
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   0fb7450c             | movzx               eax, word ptr [ebp + 0xc]
            //   50                   | push                eax

    condition:
        7 of them and filesize < 139264
}