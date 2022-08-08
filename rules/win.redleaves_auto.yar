rule win_redleaves_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.redleaves."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.redleaves"
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
        $sequence_0 = { 89f9 8d64241c d2c0 8a01 9c }
            // n = 5, score = 400
            //   89f9                 | mov                 ecx, edi
            //   8d64241c             | lea                 esp, [esp + 0x1c]
            //   d2c0                 | rol                 al, cl
            //   8a01                 | mov                 al, byte ptr [ecx]
            //   9c                   | pushfd              

        $sequence_1 = { 89d0 29f8 5f 5b }
            // n = 4, score = 400
            //   89d0                 | mov                 eax, edx
            //   29f8                 | sub                 eax, edi
            //   5f                   | pop                 edi
            //   5b                   | pop                 ebx

        $sequence_2 = { 9c 894504 9c 9c }
            // n = 4, score = 400
            //   9c                   | pushfd              
            //   894504               | mov                 dword ptr [ebp + 4], eax
            //   9c                   | pushfd              
            //   9c                   | pushfd              

        $sequence_3 = { 54 53 51 7565 7279 55 7365 }
            // n = 7, score = 400
            //   54                   | push                esp
            //   53                   | push                ebx
            //   51                   | push                ecx
            //   7565                 | jne                 0x67
            //   7279                 | jb                  0x7b
            //   55                   | push                ebp
            //   7365                 | jae                 0x67

        $sequence_4 = { 47 657449 7041 64647254 }
            // n = 4, score = 400
            //   47                   | inc                 edi
            //   657449               | je                  0x4c
            //   7041                 | jo                  0x43
            //   64647254             | jb                  0x58

        $sequence_5 = { 60 8d642430 e9???????? e8???????? }
            // n = 4, score = 300
            //   60                   | pushal              
            //   8d642430             | lea                 esp, [esp + 0x30]
            //   e9????????           |                     
            //   e8????????           |                     

        $sequence_6 = { 33c9 66898e21020000 8bce 899ec4010000 899ecc010000 e8???????? }
            // n = 6, score = 300
            //   33c9                 | xor                 ecx, ecx
            //   66898e21020000       | mov                 word ptr [esi + 0x221], cx
            //   8bce                 | mov                 ecx, esi
            //   899ec4010000         | mov                 dword ptr [esi + 0x1c4], ebx
            //   899ecc010000         | mov                 dword ptr [esi + 0x1cc], ebx
            //   e8????????           |                     

        $sequence_7 = { 56 8b750c 57 6a0c 81c100020000 }
            // n = 5, score = 300
            //   56                   | push                esi
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   57                   | push                edi
            //   6a0c                 | push                0xc
            //   81c100020000         | add                 ecx, 0x200

        $sequence_8 = { 7420 ff7514 ff750c ff7508 }
            // n = 4, score = 300
            //   7420                 | je                  0x22
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_9 = { 9c 8d642410 e9???????? 9c }
            // n = 4, score = 300
            //   9c                   | pushfd              
            //   8d642410             | lea                 esp, [esp + 0x10]
            //   e9????????           |                     
            //   9c                   | pushfd              

        $sequence_10 = { 54 9c 60 9c }
            // n = 4, score = 300
            //   54                   | push                esp
            //   9c                   | pushfd              
            //   60                   | pushal              
            //   9c                   | pushfd              

        $sequence_11 = { 60 9c e8???????? f8 }
            // n = 4, score = 300
            //   60                   | pushal              
            //   9c                   | pushfd              
            //   e8????????           |                     
            //   f8                   | clc                 

        $sequence_12 = { 84c0 740b 8325????????00 b001 5d }
            // n = 5, score = 300
            //   84c0                 | test                al, al
            //   740b                 | je                  0xd
            //   8325????????00       |                     
            //   b001                 | mov                 al, 1
            //   5d                   | pop                 ebp

        $sequence_13 = { 33f6 8d4db4 e8???????? 8b4dfc }
            // n = 4, score = 300
            //   33f6                 | xor                 esi, esi
            //   8d4db4               | lea                 ecx, [ebp - 0x4c]
            //   e8????????           |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_14 = { 53 8d8e21020000 e8???????? 8d8e14020000 }
            // n = 4, score = 300
            //   53                   | push                ebx
            //   8d8e21020000         | lea                 ecx, [esi + 0x221]
            //   e8????????           |                     
            //   8d8e14020000         | lea                 ecx, [esi + 0x214]

        $sequence_15 = { 9c 9c 8f442420 9c }
            // n = 4, score = 300
            //   9c                   | pushfd              
            //   9c                   | pushfd              
            //   8f442420             | pop                 dword ptr [esp + 0x20]
            //   9c                   | pushfd              

        $sequence_16 = { 53 8d8e14020000 e8???????? 8b861d020000 48 741f }
            // n = 6, score = 300
            //   53                   | push                ebx
            //   8d8e14020000         | lea                 ecx, [esi + 0x214]
            //   e8????????           |                     
            //   8b861d020000         | mov                 eax, dword ptr [esi + 0x21d]
            //   48                   | dec                 eax
            //   741f                 | je                  0x21

        $sequence_17 = { 53 50 e8???????? 57 53 ffb610020000 }
            // n = 6, score = 300
            //   53                   | push                ebx
            //   50                   | push                eax
            //   e8????????           |                     
            //   57                   | push                edi
            //   53                   | push                ebx
            //   ffb610020000         | push                dword ptr [esi + 0x210]

        $sequence_18 = { 0f88dc030000 60 10d2 9c }
            // n = 4, score = 200
            //   0f88dc030000         | js                  0x3e2
            //   60                   | pushal              
            //   10d2                 | adc                 dl, dl
            //   9c                   | pushfd              

    condition:
        7 of them and filesize < 1679360
}