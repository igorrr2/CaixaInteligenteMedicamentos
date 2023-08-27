; ModuleID = 'obj\Debug\120\android\marshal_methods.x86.ll'
source_filename = "obj\Debug\120\android\marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android"


%struct.MonoImage = type opaque

%struct.MonoClass = type opaque

%struct.MarshalMethodsManagedClass = type {
	i32,; uint32_t token
	%struct.MonoClass*; MonoClass* klass
}

%struct.MarshalMethodName = type {
	i64,; uint64_t id
	i8*; char* name
}

%class._JNIEnv = type opaque

%class._jobject = type {
	i8; uint8_t b
}

%class._jclass = type {
	i8; uint8_t b
}

%class._jstring = type {
	i8; uint8_t b
}

%class._jthrowable = type {
	i8; uint8_t b
}

%class._jarray = type {
	i8; uint8_t b
}

%class._jobjectArray = type {
	i8; uint8_t b
}

%class._jbooleanArray = type {
	i8; uint8_t b
}

%class._jbyteArray = type {
	i8; uint8_t b
}

%class._jcharArray = type {
	i8; uint8_t b
}

%class._jshortArray = type {
	i8; uint8_t b
}

%class._jintArray = type {
	i8; uint8_t b
}

%class._jlongArray = type {
	i8; uint8_t b
}

%class._jfloatArray = type {
	i8; uint8_t b
}

%class._jdoubleArray = type {
	i8; uint8_t b
}

; assembly_image_cache
@assembly_image_cache = local_unnamed_addr global [0 x %struct.MonoImage*] zeroinitializer, align 4
; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = local_unnamed_addr constant [266 x i32] [
	i32 32687329, ; 0: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 93
	i32 34715100, ; 1: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 122
	i32 39109920, ; 2: Newtonsoft.Json.dll => 0x254c520 => 13
	i32 57263871, ; 3: Xamarin.Forms.Core.dll => 0x369c6ff => 117
	i32 57967248, ; 4: Xamarin.Android.Support.VersionedParcelable.dll => 0x3748290 => 62
	i32 101534019, ; 5: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 107
	i32 120558881, ; 6: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 107
	i32 160529393, ; 7: Xamarin.Android.Arch.Core.Common => 0x9917bf1 => 30
	i32 165246403, ; 8: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 74
	i32 166922606, ; 9: Xamarin.Android.Support.Compat.dll => 0x9f3096e => 41
	i32 182336117, ; 10: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 108
	i32 201930040, ; 11: Xamarin.Android.Arch.Core.Runtime => 0xc093538 => 31
	i32 209399409, ; 12: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 72
	i32 230216969, ; 13: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 88
	i32 232815796, ; 14: System.Web.Services => 0xde07cb4 => 129
	i32 261689757, ; 15: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 77
	i32 278686392, ; 16: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 92
	i32 280482487, ; 17: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 86
	i32 293914992, ; 18: Xamarin.Android.Support.Transition => 0x1184c970 => 57
	i32 318968648, ; 19: Xamarin.AndroidX.Activity.dll => 0x13031348 => 64
	i32 321597661, ; 20: System.Numerics => 0x132b30dd => 24
	i32 342366114, ; 21: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 90
	i32 347068432, ; 22: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 17
	i32 385762202, ; 23: System.Memory.dll => 0x16fe439a => 23
	i32 388313361, ; 24: Xamarin.Android.Support.Animated.Vector.Drawable => 0x17253111 => 37
	i32 389971796, ; 25: Xamarin.Android.Support.Core.UI => 0x173e7f54 => 43
	i32 393699800, ; 26: Firebase => 0x177761d8 => 5
	i32 441335492, ; 27: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 76
	i32 442521989, ; 28: Xamarin.Essentials => 0x1a605985 => 116
	i32 450948140, ; 29: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 85
	i32 465846621, ; 30: mscorlib => 0x1bc4415d => 12
	i32 469710990, ; 31: System.dll => 0x1bff388e => 22
	i32 476646585, ; 32: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 86
	i32 478296930, ; 33: MQTTnet => 0x1c823b62 => 10
	i32 486930444, ; 34: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 97
	i32 514659665, ; 35: Xamarin.Android.Support.Compat => 0x1ead1551 => 41
	i32 524864063, ; 36: Xamarin.Android.Support.Print => 0x1f48ca3f => 54
	i32 526420162, ; 37: System.Transactions.dll => 0x1f6088c2 => 128
	i32 539750087, ; 38: Xamarin.Android.Support.Design => 0x202beec7 => 47
	i32 571524804, ; 39: Xamarin.Android.Support.v7.RecyclerView => 0x2210c6c4 => 60
	i32 605376203, ; 40: System.IO.Compression.FileSystem => 0x24154ecb => 126
	i32 610194910, ; 41: System.Reactive.dll => 0x245ed5de => 26
	i32 620237444, ; 42: MQTTnet.Extensions.ManagedClient.dll => 0x24f81284 => 11
	i32 627609679, ; 43: Xamarin.AndroidX.CustomView => 0x2568904f => 81
	i32 663517072, ; 44: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 113
	i32 666292255, ; 45: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 69
	i32 690569205, ; 46: System.Xml.Linq.dll => 0x29293ff5 => 130
	i32 692692150, ; 47: Xamarin.Android.Support.Annotations => 0x2949a4b6 => 38
	i32 748832960, ; 48: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 15
	i32 775507847, ; 49: System.IO.Compression => 0x2e394f87 => 125
	i32 801787702, ; 50: Xamarin.Android.Support.Interpolator => 0x2fca4f36 => 51
	i32 809851609, ; 51: System.Drawing.Common.dll => 0x30455ad9 => 124
	i32 843511501, ; 52: Xamarin.AndroidX.Print => 0x3246f6cd => 104
	i32 916714535, ; 53: Xamarin.Android.Support.Print.dll => 0x36a3f427 => 54
	i32 928116545, ; 54: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 122
	i32 955402788, ; 55: Newtonsoft.Json => 0x38f24a24 => 13
	i32 967690846, ; 56: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 90
	i32 974778368, ; 57: FormsViewGroup.dll => 0x3a19f000 => 6
	i32 987342438, ; 58: Xamarin.Android.Arch.Lifecycle.LiveData.dll => 0x3ad9a666 => 34
	i32 1012816738, ; 59: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 106
	i32 1035644815, ; 60: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 68
	i32 1042160112, ; 61: Xamarin.Forms.Platform.dll => 0x3e1e19f0 => 119
	i32 1052210849, ; 62: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 94
	i32 1098167829, ; 63: Xamarin.Android.Arch.Lifecycle.ViewModel => 0x4174b615 => 36
	i32 1098259244, ; 64: System => 0x41761b2c => 22
	i32 1175144683, ; 65: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 111
	i32 1178241025, ; 66: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 101
	i32 1204270330, ; 67: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 69
	i32 1267360935, ; 68: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 112
	i32 1292207520, ; 69: SQLitePCLRaw.core.dll => 0x4d0585a0 => 16
	i32 1292763917, ; 70: Xamarin.Android.Support.CursorAdapter.dll => 0x4d0e030d => 45
	i32 1293217323, ; 71: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 83
	i32 1297413738, ; 72: Xamarin.Android.Arch.Lifecycle.LiveData.Core => 0x4d54f66a => 33
	i32 1359785034, ; 73: Xamarin.Android.Support.Design.dll => 0x510cac4a => 47
	i32 1365406463, ; 74: System.ServiceModel.Internals.dll => 0x516272ff => 131
	i32 1376866003, ; 75: Xamarin.AndroidX.SavedState => 0x52114ed3 => 106
	i32 1395857551, ; 76: Xamarin.AndroidX.Media.dll => 0x5333188f => 98
	i32 1406073936, ; 77: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 78
	i32 1411638395, ; 78: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 27
	i32 1445445088, ; 79: Xamarin.Android.Support.Fragment => 0x5627bde0 => 50
	i32 1460219004, ; 80: Xamarin.Forms.Xaml => 0x57092c7c => 120
	i32 1462112819, ; 81: System.IO.Compression.dll => 0x57261233 => 125
	i32 1469204771, ; 82: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 67
	i32 1574652163, ; 83: Xamarin.Android.Support.Core.Utils.dll => 0x5ddb4903 => 44
	i32 1582372066, ; 84: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 82
	i32 1587447679, ; 85: Xamarin.Android.Arch.Core.Common.dll => 0x5e9e877f => 30
	i32 1592978981, ; 86: System.Runtime.Serialization.dll => 0x5ef2ee25 => 4
	i32 1622152042, ; 87: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 96
	i32 1624863272, ; 88: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 115
	i32 1636350590, ; 89: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 80
	i32 1639515021, ; 90: System.Net.Http.dll => 0x61b9038d => 3
	i32 1657153582, ; 91: System.Runtime => 0x62c6282e => 28
	i32 1658241508, ; 92: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 109
	i32 1658251792, ; 93: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 121
	i32 1662014763, ; 94: Xamarin.Android.Support.Vector.Drawable => 0x6310552b => 61
	i32 1670060433, ; 95: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 77
	i32 1711441057, ; 96: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 17
	i32 1729485958, ; 97: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 73
	i32 1766324549, ; 98: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 108
	i32 1776026572, ; 99: System.Core.dll => 0x69dc03cc => 20
	i32 1788241197, ; 100: Xamarin.AndroidX.Fragment => 0x6a96652d => 85
	i32 1808609942, ; 101: Xamarin.AndroidX.Loader => 0x6bcd3296 => 96
	i32 1813201214, ; 102: Xamarin.Google.Android.Material => 0x6c13413e => 121
	i32 1818569960, ; 103: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 102
	i32 1843880773, ; 104: CaixaInteligente.dll => 0x6de76345 => 0
	i32 1866717392, ; 105: Xamarin.Android.Support.Interpolator.dll => 0x6f43d8d0 => 51
	i32 1867746548, ; 106: Xamarin.Essentials.dll => 0x6f538cf4 => 116
	i32 1877418711, ; 107: Xamarin.Android.Support.v7.RecyclerView.dll => 0x6fe722d7 => 60
	i32 1878053835, ; 108: Xamarin.Forms.Xaml.dll => 0x6ff0d3cb => 120
	i32 1885316902, ; 109: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 70
	i32 1904755420, ; 110: System.Runtime.InteropServices.WindowsRuntime.dll => 0x718842dc => 2
	i32 1916660109, ; 111: Xamarin.Android.Arch.Lifecycle.ViewModel.dll => 0x723de98d => 36
	i32 1919157823, ; 112: Xamarin.AndroidX.MultiDex.dll => 0x7264063f => 99
	i32 2011961780, ; 113: System.Buffers.dll => 0x77ec19b4 => 19
	i32 2019465201, ; 114: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 94
	i32 2037417872, ; 115: Xamarin.Android.Support.ViewPager => 0x79708790 => 63
	i32 2044222327, ; 116: Xamarin.Android.Support.Loader => 0x79d85b77 => 52
	i32 2055257422, ; 117: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 91
	i32 2079903147, ; 118: System.Runtime.dll => 0x7bf8cdab => 28
	i32 2090596640, ; 119: System.Numerics.Vectors => 0x7c9bf920 => 25
	i32 2097448633, ; 120: Xamarin.AndroidX.Legacy.Support.Core.UI => 0x7d0486b9 => 87
	i32 2103459038, ; 121: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 18
	i32 2126786730, ; 122: Xamarin.Forms.Platform.Android => 0x7ec430aa => 118
	i32 2139458754, ; 123: Xamarin.Android.Support.DrawerLayout => 0x7f858cc2 => 49
	i32 2166116741, ; 124: Xamarin.Android.Support.Core.Utils => 0x811c5185 => 44
	i32 2196165013, ; 125: Xamarin.Android.Support.VersionedParcelable => 0x82e6d195 => 62
	i32 2201231467, ; 126: System.Net.Http => 0x8334206b => 3
	i32 2217644978, ; 127: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 111
	i32 2244775296, ; 128: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 97
	i32 2256548716, ; 129: Xamarin.AndroidX.MultiDex => 0x8680336c => 99
	i32 2261435625, ; 130: Xamarin.AndroidX.Legacy.Support.V4.dll => 0x86cac4e9 => 89
	i32 2279755925, ; 131: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 105
	i32 2315684594, ; 132: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 65
	i32 2330457430, ; 133: Xamarin.Android.Support.Core.UI.dll => 0x8ae7f556 => 43
	i32 2330986192, ; 134: Xamarin.Android.Support.SlidingPaneLayout.dll => 0x8af006d0 => 55
	i32 2373288475, ; 135: Xamarin.Android.Support.Fragment.dll => 0x8d75821b => 50
	i32 2409053734, ; 136: Xamarin.AndroidX.Preference.dll => 0x8f973e26 => 103
	i32 2440966767, ; 137: Xamarin.Android.Support.Loader.dll => 0x917e326f => 52
	i32 2465273461, ; 138: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 15
	i32 2465532216, ; 139: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 76
	i32 2471841756, ; 140: netstandard.dll => 0x93554fdc => 1
	i32 2475788418, ; 141: Java.Interop.dll => 0x93918882 => 7
	i32 2487632829, ; 142: Xamarin.Android.Support.DocumentFile => 0x944643bd => 48
	i32 2501346920, ; 143: System.Data.DataSetExtensions => 0x95178668 => 123
	i32 2505896520, ; 144: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 93
	i32 2581819634, ; 145: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 112
	i32 2620871830, ; 146: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 80
	i32 2624644809, ; 147: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 84
	i32 2633051222, ; 148: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 92
	i32 2698266930, ; 149: Xamarin.Android.Arch.Lifecycle.LiveData => 0xa0d44932 => 34
	i32 2701096212, ; 150: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 109
	i32 2732626843, ; 151: Xamarin.AndroidX.Activity => 0xa2e0939b => 64
	i32 2737747696, ; 152: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 67
	i32 2751899777, ; 153: Xamarin.Android.Support.Collections => 0xa406a881 => 40
	i32 2766581644, ; 154: Xamarin.Forms.Core => 0xa4e6af8c => 117
	i32 2778768386, ; 155: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 114
	i32 2788639665, ; 156: Xamarin.Android.Support.LocalBroadcastManager => 0xa63743b1 => 53
	i32 2788775637, ; 157: Xamarin.Android.Support.SwipeRefreshLayout.dll => 0xa63956d5 => 56
	i32 2810250172, ; 158: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 78
	i32 2819470561, ; 159: System.Xml.dll => 0xa80db4e1 => 29
	i32 2853208004, ; 160: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 114
	i32 2855708567, ; 161: Xamarin.AndroidX.Transition => 0xaa36a797 => 110
	i32 2876493027, ; 162: Xamarin.Android.Support.SwipeRefreshLayout => 0xab73cce3 => 56
	i32 2893257763, ; 163: Xamarin.Android.Arch.Core.Runtime.dll => 0xac739c23 => 31
	i32 2903344695, ; 164: System.ComponentModel.Composition => 0xad0d8637 => 127
	i32 2905242038, ; 165: mscorlib.dll => 0xad2a79b6 => 12
	i32 2916838712, ; 166: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 115
	i32 2919462931, ; 167: System.Numerics.Vectors.dll => 0xae037813 => 25
	i32 2921128767, ; 168: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 66
	i32 2921692953, ; 169: Xamarin.Android.Support.CustomView.dll => 0xae257f19 => 46
	i32 2922925221, ; 170: Xamarin.Android.Support.Vector.Drawable.dll => 0xae384ca5 => 61
	i32 2978675010, ; 171: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 83
	i32 2997658596, ; 172: MQTTnet.dll => 0xb2aca3e4 => 10
	i32 3024354802, ; 173: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 88
	i32 3044182254, ; 174: FormsViewGroup => 0xb57288ee => 6
	i32 3056250942, ; 175: Xamarin.Android.Support.AsyncLayoutInflater.dll => 0xb62ab03e => 39
	i32 3057625584, ; 176: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 100
	i32 3068715062, ; 177: Xamarin.Android.Arch.Lifecycle.Common => 0xb6e8e036 => 32
	i32 3111772706, ; 178: System.Runtime.Serialization => 0xb979e222 => 4
	i32 3204380047, ; 179: System.Data.dll => 0xbefef58f => 21
	i32 3204912593, ; 180: Xamarin.Android.Support.AsyncLayoutInflater => 0xbf0715d1 => 39
	i32 3211777861, ; 181: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 82
	i32 3233339011, ; 182: Xamarin.Android.Arch.Lifecycle.LiveData.Core.dll => 0xc0b8d683 => 33
	i32 3247949154, ; 183: Mono.Security => 0xc197c562 => 132
	i32 3258312781, ; 184: Xamarin.AndroidX.CardView => 0xc235e84d => 73
	i32 3267021929, ; 185: Xamarin.AndroidX.AsyncLayoutInflater => 0xc2bacc69 => 71
	i32 3286872994, ; 186: SQLite-net.dll => 0xc3e9b3a2 => 14
	i32 3296380511, ; 187: Xamarin.Android.Support.Collections.dll => 0xc47ac65f => 40
	i32 3317135071, ; 188: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 81
	i32 3317144872, ; 189: System.Data => 0xc5b79d28 => 21
	i32 3321585405, ; 190: Xamarin.Android.Support.DocumentFile.dll => 0xc5fb5efd => 48
	i32 3322403133, ; 191: Firebase.dll => 0xc607d93d => 5
	i32 3340431453, ; 192: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 70
	i32 3346324047, ; 193: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 101
	i32 3352662376, ; 194: Xamarin.Android.Support.CoordinaterLayout => 0xc7d59168 => 42
	i32 3353484488, ; 195: Xamarin.AndroidX.Legacy.Support.Core.UI.dll => 0xc7e21cc8 => 87
	i32 3357663996, ; 196: Xamarin.Android.Support.CursorAdapter => 0xc821e2fc => 45
	i32 3360279109, ; 197: SQLitePCLRaw.core => 0xc849ca45 => 16
	i32 3362522851, ; 198: Xamarin.AndroidX.Core => 0xc86c06e3 => 79
	i32 3366347497, ; 199: Java.Interop => 0xc8a662e9 => 7
	i32 3374999561, ; 200: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 105
	i32 3395150330, ; 201: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 27
	i32 3404865022, ; 202: System.ServiceModel.Internals => 0xcaf21dfe => 131
	i32 3429136800, ; 203: System.Xml => 0xcc6479a0 => 29
	i32 3430777524, ; 204: netstandard => 0xcc7d82b4 => 1
	i32 3439690031, ; 205: Xamarin.Android.Support.Annotations.dll => 0xcd05812f => 38
	i32 3441283291, ; 206: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 84
	i32 3464261704, ; 207: CaixaInteligente => 0xce7c7048 => 0
	i32 3476120550, ; 208: Mono.Android => 0xcf3163e6 => 9
	i32 3486566296, ; 209: System.Transactions => 0xcfd0c798 => 128
	i32 3493954962, ; 210: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 75
	i32 3498942916, ; 211: Xamarin.Android.Support.v7.CardView.dll => 0xd08da1c4 => 59
	i32 3501239056, ; 212: Xamarin.AndroidX.AsyncLayoutInflater.dll => 0xd0b0ab10 => 71
	i32 3506786196, ; 213: MQTTnet.Extensions.ManagedClient => 0xd1054f94 => 11
	i32 3509114376, ; 214: System.Xml.Linq => 0xd128d608 => 130
	i32 3536029504, ; 215: Xamarin.Forms.Platform.Android.dll => 0xd2c38740 => 118
	i32 3547625832, ; 216: Xamarin.Android.Support.SlidingPaneLayout => 0xd3747968 => 55
	i32 3567349600, ; 217: System.ComponentModel.Composition.dll => 0xd4a16f60 => 127
	i32 3596207933, ; 218: LiteDB.dll => 0xd659c73d => 8
	i32 3618140916, ; 219: Xamarin.AndroidX.Preference => 0xd7a872f4 => 103
	i32 3627220390, ; 220: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 104
	i32 3629588173, ; 221: LiteDB => 0xd8571ecd => 8
	i32 3632359727, ; 222: Xamarin.Forms.Platform => 0xd881692f => 119
	i32 3633644679, ; 223: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 66
	i32 3641597786, ; 224: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 91
	i32 3664423555, ; 225: Xamarin.Android.Support.ViewPager.dll => 0xda6aaa83 => 63
	i32 3672681054, ; 226: Mono.Android.dll => 0xdae8aa5e => 9
	i32 3676310014, ; 227: System.Web.Services.dll => 0xdb2009fe => 129
	i32 3678221644, ; 228: Xamarin.Android.Support.v7.AppCompat => 0xdb3d354c => 58
	i32 3681174138, ; 229: Xamarin.Android.Arch.Lifecycle.Common.dll => 0xdb6a427a => 32
	i32 3682565725, ; 230: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 72
	i32 3684561358, ; 231: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 75
	i32 3684933406, ; 232: System.Runtime.InteropServices.WindowsRuntime => 0xdba39f1e => 2
	i32 3689375977, ; 233: System.Drawing.Common => 0xdbe768e9 => 124
	i32 3714038699, ; 234: Xamarin.Android.Support.LocalBroadcastManager.dll => 0xdd5fbbab => 53
	i32 3718463572, ; 235: Xamarin.Android.Support.Animated.Vector.Drawable.dll => 0xdda34054 => 37
	i32 3718780102, ; 236: Xamarin.AndroidX.Annotation => 0xdda814c6 => 65
	i32 3724971120, ; 237: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 100
	i32 3731644420, ; 238: System.Reactive => 0xde6c6004 => 26
	i32 3754567612, ; 239: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 18
	i32 3758932259, ; 240: Xamarin.AndroidX.Legacy.Support.V4 => 0xe00cc123 => 89
	i32 3776062606, ; 241: Xamarin.Android.Support.DrawerLayout.dll => 0xe112248e => 49
	i32 3786282454, ; 242: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 74
	i32 3822602673, ; 243: Xamarin.AndroidX.Media => 0xe3d849b1 => 98
	i32 3829621856, ; 244: System.Numerics.dll => 0xe4436460 => 24
	i32 3832731800, ; 245: Xamarin.Android.Support.CoordinaterLayout.dll => 0xe472d898 => 42
	i32 3862817207, ; 246: Xamarin.Android.Arch.Lifecycle.Runtime.dll => 0xe63de9b7 => 35
	i32 3874897629, ; 247: Xamarin.Android.Arch.Lifecycle.Runtime => 0xe6f63edd => 35
	i32 3876362041, ; 248: SQLite-net => 0xe70c9739 => 14
	i32 3883175360, ; 249: Xamarin.Android.Support.v7.AppCompat.dll => 0xe7748dc0 => 58
	i32 3885922214, ; 250: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 110
	i32 3896760992, ; 251: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 79
	i32 3920810846, ; 252: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 126
	i32 3921031405, ; 253: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 113
	i32 3931092270, ; 254: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 102
	i32 3945713374, ; 255: System.Data.DataSetExtensions.dll => 0xeb2ecede => 123
	i32 3955647286, ; 256: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 68
	i32 4025784931, ; 257: System.Memory => 0xeff49a63 => 23
	i32 4063435586, ; 258: Xamarin.Android.Support.CustomView => 0xf2331b42 => 46
	i32 4105002889, ; 259: Mono.Security.dll => 0xf4ad5f89 => 132
	i32 4151237749, ; 260: System.Core => 0xf76edc75 => 20
	i32 4182413190, ; 261: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 95
	i32 4216993138, ; 262: Xamarin.Android.Support.Transition.dll => 0xfb5a3572 => 57
	i32 4219003402, ; 263: Xamarin.Android.Support.v7.CardView => 0xfb78e20a => 59
	i32 4260525087, ; 264: System.Buffers => 0xfdf2741f => 19
	i32 4292120959 ; 265: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 95
], align 4
@assembly_image_cache_indices = local_unnamed_addr constant [266 x i32] [
	i32 93, i32 122, i32 13, i32 117, i32 62, i32 107, i32 107, i32 30, ; 0..7
	i32 74, i32 41, i32 108, i32 31, i32 72, i32 88, i32 129, i32 77, ; 8..15
	i32 92, i32 86, i32 57, i32 64, i32 24, i32 90, i32 17, i32 23, ; 16..23
	i32 37, i32 43, i32 5, i32 76, i32 116, i32 85, i32 12, i32 22, ; 24..31
	i32 86, i32 10, i32 97, i32 41, i32 54, i32 128, i32 47, i32 60, ; 32..39
	i32 126, i32 26, i32 11, i32 81, i32 113, i32 69, i32 130, i32 38, ; 40..47
	i32 15, i32 125, i32 51, i32 124, i32 104, i32 54, i32 122, i32 13, ; 48..55
	i32 90, i32 6, i32 34, i32 106, i32 68, i32 119, i32 94, i32 36, ; 56..63
	i32 22, i32 111, i32 101, i32 69, i32 112, i32 16, i32 45, i32 83, ; 64..71
	i32 33, i32 47, i32 131, i32 106, i32 98, i32 78, i32 27, i32 50, ; 72..79
	i32 120, i32 125, i32 67, i32 44, i32 82, i32 30, i32 4, i32 96, ; 80..87
	i32 115, i32 80, i32 3, i32 28, i32 109, i32 121, i32 61, i32 77, ; 88..95
	i32 17, i32 73, i32 108, i32 20, i32 85, i32 96, i32 121, i32 102, ; 96..103
	i32 0, i32 51, i32 116, i32 60, i32 120, i32 70, i32 2, i32 36, ; 104..111
	i32 99, i32 19, i32 94, i32 63, i32 52, i32 91, i32 28, i32 25, ; 112..119
	i32 87, i32 18, i32 118, i32 49, i32 44, i32 62, i32 3, i32 111, ; 120..127
	i32 97, i32 99, i32 89, i32 105, i32 65, i32 43, i32 55, i32 50, ; 128..135
	i32 103, i32 52, i32 15, i32 76, i32 1, i32 7, i32 48, i32 123, ; 136..143
	i32 93, i32 112, i32 80, i32 84, i32 92, i32 34, i32 109, i32 64, ; 144..151
	i32 67, i32 40, i32 117, i32 114, i32 53, i32 56, i32 78, i32 29, ; 152..159
	i32 114, i32 110, i32 56, i32 31, i32 127, i32 12, i32 115, i32 25, ; 160..167
	i32 66, i32 46, i32 61, i32 83, i32 10, i32 88, i32 6, i32 39, ; 168..175
	i32 100, i32 32, i32 4, i32 21, i32 39, i32 82, i32 33, i32 132, ; 176..183
	i32 73, i32 71, i32 14, i32 40, i32 81, i32 21, i32 48, i32 5, ; 184..191
	i32 70, i32 101, i32 42, i32 87, i32 45, i32 16, i32 79, i32 7, ; 192..199
	i32 105, i32 27, i32 131, i32 29, i32 1, i32 38, i32 84, i32 0, ; 200..207
	i32 9, i32 128, i32 75, i32 59, i32 71, i32 11, i32 130, i32 118, ; 208..215
	i32 55, i32 127, i32 8, i32 103, i32 104, i32 8, i32 119, i32 66, ; 216..223
	i32 91, i32 63, i32 9, i32 129, i32 58, i32 32, i32 72, i32 75, ; 224..231
	i32 2, i32 124, i32 53, i32 37, i32 65, i32 100, i32 26, i32 18, ; 232..239
	i32 89, i32 49, i32 74, i32 98, i32 24, i32 42, i32 35, i32 35, ; 240..247
	i32 14, i32 58, i32 110, i32 79, i32 126, i32 113, i32 102, i32 123, ; 248..255
	i32 68, i32 23, i32 46, i32 132, i32 20, i32 95, i32 57, i32 59, ; 256..263
	i32 19, i32 95 ; 264..265
], align 4

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 4; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 4

; Function attributes: "frame-pointer"="none" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn writeonly
define void @xamarin_app_init (void (i32, i32, i32, i8**)* %fn) local_unnamed_addr #0
{
	store void (i32, i32, i32, i8**)* %fn, void (i32, i32, i32, i8**)** @get_function_pointer, align 4
	ret void
}

; Names of classes in which marshal methods reside
@mm_class_names = local_unnamed_addr constant [0 x i8*] zeroinitializer, align 4
@__MarshalMethodName_name.0 = internal constant [1 x i8] c"\00", align 1

; mm_method_names
@mm_method_names = local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	; 0
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		i8* getelementptr inbounds ([1 x i8], [1 x i8]* @__MarshalMethodName_name.0, i32 0, i32 0); name
	}
], align 8; end of 'mm_method_names' array


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="none" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" "stackrealign" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="none" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" "stackrealign" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{!"Xamarin.Android remotes/origin/d17-5 @ a200af12c1e846626b8caebd926ac14c185f71ec"}
!llvm.linker.options = !{}
