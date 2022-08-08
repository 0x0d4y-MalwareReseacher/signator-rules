rule win_collectorgoomba_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.collectorgoomba."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.collectorgoomba"
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
        $sequence_0 = { e8???????? 59 8b00 8945fc 8d4510 50 e8???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8d4510               | lea                 eax, [ebp + 0x10]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_1 = { eb10 8b45fc 40 8945fc 8b45f0 83c00c 8945f0 }
            // n = 7, score = 200
            //   eb10                 | jmp                 0x12
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   40                   | inc                 eax
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   83c00c               | add                 eax, 0xc
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax

        $sequence_2 = { c705????????04010002 c705????????090c0603 c705????????0605010c 833d????????00 740a c705????????03030d07 c705????????060d0003 }
            // n = 7, score = 200
            //   c705????????04010002     |     
            //   c705????????090c0603     |     
            //   c705????????0605010c     |     
            //   833d????????00       |                     
            //   740a                 | je                  0xc
            //   c705????????03030d07     |     
            //   c705????????060d0003     |     

        $sequence_3 = { ff750c 8d45c0 50 8b4df8 e8???????? ff750c ff75c8 }
            // n = 7, score = 200
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   8d45c0               | lea                 eax, [ebp - 0x40]
            //   50                   | push                eax
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   e8????????           |                     
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff75c8               | push                dword ptr [ebp - 0x38]

        $sequence_4 = { ff75fc 8d45f0 50 e8???????? 83c41c 68604bbbf6 6a10 }
            // n = 7, score = 200
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   68604bbbf6           | push                0xf6bb4b60
            //   6a10                 | push                0x10

        $sequence_5 = { ff75bc 8d8d20fbffff e8???????? 8985d4fbffff c645fc06 6a03 ff75ec }
            // n = 7, score = 200
            //   ff75bc               | push                dword ptr [ebp - 0x44]
            //   8d8d20fbffff         | lea                 ecx, [ebp - 0x4e0]
            //   e8????????           |                     
            //   8985d4fbffff         | mov                 dword ptr [ebp - 0x42c], eax
            //   c645fc06             | mov                 byte ptr [ebp - 4], 6
            //   6a03                 | push                3
            //   ff75ec               | push                dword ptr [ebp - 0x14]

        $sequence_6 = { ff75ec e8???????? 83c410 8945fc 8b4508 8a4ddc 8808 }
            // n = 7, score = 200
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8a4ddc               | mov                 cl, byte ptr [ebp - 0x24]
            //   8808                 | mov                 byte ptr [eax], cl

        $sequence_7 = { e8???????? 8945e4 8b4d0c e8???????? 8945e0 ff75e4 ff75e0 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   e8????????           |                     
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   ff75e0               | push                dword ptr [ebp - 0x20]

        $sequence_8 = { ff75f4 e8???????? 83c414 e9???????? 837de000 7511 837dc800 }
            // n = 7, score = 200
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   e9????????           |                     
            //   837de000             | cmp                 dword ptr [ebp - 0x20], 0
            //   7511                 | jne                 0x13
            //   837dc800             | cmp                 dword ptr [ebp - 0x38], 0

        $sequence_9 = { eb07 c745d498334900 8b45fc ff30 ff75d4 8b45d0 ff30 }
            // n = 7, score = 200
            //   eb07                 | jmp                 9
            //   c745d498334900       | mov                 dword ptr [ebp - 0x2c], 0x493398
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   ff30                 | push                dword ptr [eax]
            //   ff75d4               | push                dword ptr [ebp - 0x2c]
            //   8b45d0               | mov                 eax, dword ptr [ebp - 0x30]
            //   ff30                 | push                dword ptr [eax]

    condition:
        7 of them and filesize < 1400832
}