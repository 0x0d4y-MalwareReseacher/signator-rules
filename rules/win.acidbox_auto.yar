rule win_acidbox_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.acidbox."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.acidbox"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { ffc2 89542420 41ffc5 44896c2428 ebd7 83feff 7440 }
            // n = 7, score = 400
            //   ffc2                 | test                eax, eax
            //   89542420             | je                  0x1ef0
            //   41ffc5               | je                  0x1f2f
            //   44896c2428           | dec                 ebp
            //   ebd7                 | test                ecx, ecx
            //   83feff               | je                  0x1f2f
            //   7440                 | dec                 esp

        $sequence_1 = { eb02 03c0 80c1ff 75ec 41ffc0 418901 4983c104 }
            // n = 7, score = 400
            //   eb02                 | pop                 edi
            //   03c0                 | inc                 ecx
            //   80c1ff               | pop                 esi
            //   75ec                 | mov                 eax, ebx
            //   41ffc0               | dec                 esp
            //   418901               | lea                 ebx, [esp + 0x150]
            //   4983c104             | dec                 ecx

        $sequence_2 = { 48894008 488900 4489742424 498bd6 b930000000 ff15???????? }
            // n = 6, score = 400
            //   48894008             | mov                 esi, dword ptr [edi + 0x48]
            //   488900               | mov                 dword ptr [edi + 0x48], 0x44332211
            //   4489742424           | jne                 0x15f8
            //   498bd6               | mov                 edx, dword ptr [edi + 0x12]
            //   b930000000           | dec                 eax
            //   ff15????????         |                     

        $sequence_3 = { 488b01 483bc1 741a 4885c0 7415 48397810 }
            // n = 6, score = 400
            //   488b01               | je                  0x980
            //   483bc1               | dec                 eax
            //   741a                 | lea                 eax, [esp + 0x180]
            //   4885c0               | dec                 eax
            //   7415                 | mov                 dword ptr [esp + 0x20], eax
            //   48397810             | inc                 ebp

        $sequence_4 = { 488b75a8 413bfb 0f8630ffffff 448b65b4 4423e3 443b6594 0f841bffffff }
            // n = 7, score = 400
            //   488b75a8             | mov                 dword ptr [edx], ecx
            //   413bfb               | dec                 eax
            //   0f8630ffffff         | mov                 dword ptr [edx + 8], eax
            //   448b65b4             | dec                 ecx
            //   4423e3               | mov                 eax, dword ptr [ecx + 0x10]
            //   443b6594             | dec                 ecx
            //   0f841bffffff         | mov                 eax, 0

        $sequence_5 = { 41d1ee ffce 83e001 894704 }
            // n = 4, score = 400
            //   41d1ee               | dec                 eax
            //   ffce                 | sub                 esp, 0x270
            //   83e001               | inc                 ecx
            //   894704               | mov                 ebx, eax

        $sequence_6 = { c64424384d c744244075696400 c644243f47 4885f6 }
            // n = 4, score = 400
            //   c64424384d           | dec                 ebp
            //   c744244075696400     | mov                 edx, edi
            //   c644243f47           | dec                 eax
            //   4885f6               | arpl                dx, ax

        $sequence_7 = { eb2a 6644857e18 7523 488b4720 83b8f400000000 772c }
            // n = 6, score = 400
            //   eb2a                 | mov                 ebx, 0x80070b06
            //   6644857e18           | mov                 dword ptr [esp + 0x20], ebx
            //   7523                 | dec                 ebp
            //   488b4720             | mov                 eax, edi
            //   83b8f400000000       | mov                 edx, 0x104
            //   772c                 | inc                 esp

        $sequence_8 = { 418bc4 e9???????? 488b4328 483b7b18 0f827e010000 8b4050 48034318 }
            // n = 7, score = 400
            //   418bc4               | dec                 eax
            //   e9????????           |                     
            //   488b4328             | mov                 dword ptr [esp + 0x40], eax
            //   483b7b18             | dec                 eax
            //   0f827e010000         | test                esi, esi
            //   8b4050               | je                  0x19c8
            //   48034318             | dec                 eax

        $sequence_9 = { c644244c6f c644245972 66c744243d6e65 c744243961636869 c64424384d c744244075696400 }
            // n = 6, score = 400
            //   c644244c6f           | inc                 ecx
            //   c644245972           | cmp                 esi, 1
            //   66c744243d6e65       | jne                 0x19c4
            //   c744243961636869     | dec                 esp
            //   c64424384d           | imul                esi, eax, 0x128
            //   c744244075696400     | inc                 ecx

    condition:
        7 of them and filesize < 589824
}