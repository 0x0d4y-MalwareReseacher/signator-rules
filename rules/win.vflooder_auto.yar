rule win_vflooder_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.vflooder."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.vflooder"
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
        $sequence_0 = { e8???????? 0000 43 7265 61 }
            // n = 5, score = 400
            //   e8????????           |                     
            //   0000                 | add                 byte ptr [eax], al
            //   43                   | inc                 ebx
            //   7265                 | jb                  0x67
            //   61                   | popal               

        $sequence_1 = { b02e f5 f2ae e8???????? }
            // n = 4, score = 400
            //   b02e                 | mov                 al, 0x2e
            //   f5                   | cmc                 
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   e8????????           |                     

        $sequence_2 = { f5 83ef04 f5 ff37 }
            // n = 4, score = 400
            //   f5                   | cmc                 
            //   83ef04               | sub                 edi, 4
            //   f5                   | cmc                 
            //   ff37                 | push                dword ptr [edi]

        $sequence_3 = { 3b45f0 60 9c 8d642424 }
            // n = 4, score = 400
            //   3b45f0               | cmp                 eax, dword ptr [ebp - 0x10]
            //   60                   | pushal              
            //   9c                   | pushfd              
            //   8d642424             | lea                 esp, [esp + 0x24]

        $sequence_4 = { 9c 60 9c 9c 8d642430 }
            // n = 5, score = 400
            //   9c                   | pushfd              
            //   60                   | pushal              
            //   9c                   | pushfd              
            //   9c                   | pushfd              
            //   8d642430             | lea                 esp, [esp + 0x30]

        $sequence_5 = { 0000 43 7265 61 }
            // n = 4, score = 400
            //   0000                 | add                 byte ptr [eax], al
            //   43                   | inc                 ebx
            //   7265                 | jb                  0x67
            //   61                   | popal               

        $sequence_6 = { 60 ff35???????? 8f442438 9c }
            // n = 4, score = 400
            //   60                   | pushal              
            //   ff35????????         |                     
            //   8f442438             | pop                 dword ptr [esp + 0x38]
            //   9c                   | pushfd              

        $sequence_7 = { 9c ff742404 8f4500 9c }
            // n = 4, score = 400
            //   9c                   | pushfd              
            //   ff742404             | push                dword ptr [esp + 4]
            //   8f4500               | pop                 dword ptr [ebp]
            //   9c                   | pushfd              

        $sequence_8 = { 9c ff742404 8d642434 e9???????? }
            // n = 4, score = 400
            //   9c                   | pushfd              
            //   ff742404             | push                dword ptr [esp + 4]
            //   8d642434             | lea                 esp, [esp + 0x34]
            //   e9????????           |                     

        $sequence_9 = { 9c f2ae 9c 9c }
            // n = 4, score = 400
            //   9c                   | pushfd              
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   9c                   | pushfd              
            //   9c                   | pushfd              

    condition:
        7 of them and filesize < 860160
}