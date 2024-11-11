rule win_jupiter_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.jupiter."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.jupiter"
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
        $sequence_0 = { 50 6802000000 ff35???????? ff35???????? }
            // n = 4, score = 400
            //   50                   | dec                 eax
            //   6802000000           | mov                 edi, ecx
            //   ff35????????         |                     
            //   ff35????????         |                     

        $sequence_1 = { 66c705????????0101 c605????????01 c605????????01 66c705????????0101 }
            // n = 4, score = 400
            //   66c705????????0101     |     
            //   c605????????01       |                     
            //   c605????????01       |                     
            //   66c705????????0101     |     

        $sequence_2 = { c605????????01 66c705????????0101 c605????????01 c605????????01 66c705????????0101 }
            // n = 5, score = 400
            //   c605????????01       |                     
            //   66c705????????0101     |     
            //   c605????????01       |                     
            //   c605????????01       |                     
            //   66c705????????0101     |     

        $sequence_3 = { 8a4146 884105 8b4144 c1f808 884106 }
            // n = 5, score = 400
            //   8a4146               | mov                 esi, eax
            //   884105               | dec                 eax
            //   8b4144               | cmp                 eax, -1
            //   c1f808               | je                  0x4b6
            //   884106               | dec                 eax

        $sequence_4 = { 884104 8a4146 884105 8b4144 c1f808 884106 }
            // n = 6, score = 400
            //   884104               | dec                 eax
            //   8a4146               | lea                 edx, [0x11e4b]
            //   884105               | dec                 ecx
            //   8b4144               | mov                 ecx, edi
            //   c1f808               | dec                 eax
            //   884106               | mov                 edx, esi

        $sequence_5 = { 8a4146 884105 8b4144 c1f808 }
            // n = 4, score = 400
            //   8a4146               | mov                 eax, eax
            //   884105               | jmp                 0x1d5
            //   8b4144               | dec                 eax
            //   c1f808               | or                  eax, 0xffffffff

        $sequence_6 = { 66c705????????0101 c605????????01 c605????????01 c605????????01 }
            // n = 4, score = 400
            //   66c705????????0101     |     
            //   c605????????01       |                     
            //   c605????????01       |                     
            //   c605????????01       |                     

        $sequence_7 = { c605????????01 66c705????????0101 c605????????01 c605????????01 66c705????????0101 c605????????01 }
            // n = 6, score = 400
            //   c605????????01       |                     
            //   66c705????????0101     |     
            //   c605????????01       |                     
            //   c605????????01       |                     
            //   66c705????????0101     |     
            //   c605????????01       |                     

        $sequence_8 = { c1f808 884106 8a4144 884107 }
            // n = 4, score = 400
            //   c1f808               | shl                 ecx, 2
            //   884106               | shl                 edx, 0xa
            //   8a4144               | add                 ebx, 3
            //   884107               | and                 ebx, 0xfffffffc

        $sequence_9 = { c605????????01 c605????????01 66c705????????0101 c605????????01 }
            // n = 4, score = 400
            //   c605????????01       |                     
            //   c605????????01       |                     
            //   66c705????????0101     |     
            //   c605????????01       |                     

    condition:
        7 of them and filesize < 224112
}