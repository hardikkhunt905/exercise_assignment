# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in F:\Android\sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}


###---------------Begin: proguard configuration for Gson  ----------
## Gson uses generic type information stored in a class file when working with fields. Proguard
## removes such information by default, so configure it to keep all of it.
#-dontusemixedcaseclassnames
#-dontskipnonpubliclibraryclasses
#-verbose
#
## Optimization is turned off by default. Dex does not like code run
## through the ProGuard optimize and preverify steps (and performs some
## of these optimizations on its own).
##-dontoptimize
##-dontpreverify
#
## If you want to enable optimization, you should include the
## following:
#-optimizations !code/simplification/arithmetic,!code/simplification/cast,!field/*,!class/merging/*
#-optimizationpasses 5
#-allowaccessmodification
##
## Note that you cannot just include these flags in your own
## configuration file; if you are including this file, optimization
## will be turned off. You'll need to either edit this file, or
## duplicate the contents of this file and remove the include of this
## file from your project's proguard.config path property.
#
#
#-keep public class * extends android.app.Activity
#-keep public class * extends android.app.Application
#-keep public class * extends android.app.Service
#-keep public class * extends android.content.BroadcastReceiver
#-keep public class * extends android.content.ContentProvider
#-keep public class * extends android.app.backup.BackupAgent
#-keep public class * extends android.preference.Preference
#-keep public class * extends android.support.v4.app.Fragment
#-keep public class * extends android.support.v4.app.DialogFragment
#-keep public class * extends android.app.Fragment
#-keep public class com.android.vending.licensing.ILicensingService

## For native methods, see http://proguard.sourceforge.net/manual/examples.html#native
#-keepclasseswithmembernames class * {
# native <methods>;
#}
#
#-keep public class * extends android.view.View {
# public <init>(android.content.Context);
# public <init>(android.content.Context, android.util.AttributeSet);
# public <init>(android.content.Context, android.util.AttributeSet, int);
# public void set*(...);
#}
#
#-keepclasseswithmembers class * {
# public <init>(android.content.Context, android.util.AttributeSet);
#}
#
#-keepclasseswithmembers class * {
# public <init>(android.content.Context, android.util.AttributeSet, int);
#}
#
#-keepclassmembers class * extends android.content.Context {
#   public void *(android.view.View);
#   public void *(android.view.MenuItem);
#}
#
#-keepclassmembers class * extends android.app.Activity {
# public void *(android.view.View);
#}
#
## For enumeration classes, see http://proguard.sourceforge.net/manual/examples.html#enumerations
#-keepclassmembers enum * {
# public static **[] values();
# public static ** valueOf(java.lang.String);
#}
#
#-keep class * implements android.os.Parcelable {
# public static final android.os.Parcelable$Creator *;
#}
#
#-keepclassmembers class **.R$* {
# public static <fields>;
#}
#
#-keepclassmembers class * {
#    @android.webkit.JavascriptInterface <methods>;
#}
#
#
#-keep class android.support.v4.app.** { *; }
#-keep interface android.support.v4.app.** { *; }
#
#-keep class android.support.v7.app.** { *; }
#-keep interface android.support.v7.app.** { *; }
#
#-keep class android.support.design.** { *; }
#-keep interface android.support.design.** { *; }
#
## The support library contains references to newer platform versions.
## Don't warn about those in case this app is linking against an older
## platform version. We know about them, and they are safe.
#-dontwarn android.support.**
#-dontwarn com.google.ads.**
#
#-flattenpackagehierarchy 'com.sku.photosuit'
#
###---------------Begin: proguard configuration for Gson  ----------
## Gson uses generic type information stored in a class file when working with fields. Proguard
## removes such information by default, so configure it to keep all of it.
#-keepattributes Signature
#
#-keepattributes Exceptions,InnerClasses,Signature,Deprecated,SourceFile,LineNumberTable,*Annotation*,EnclosingMethod
#
## For using GSON @Expose annotation
#-keepattributes *Annotation*
#
## Gson specific classes
#-keep class sun.misc.Unsafe { *; }
##-keep class com.google.gson.stream.** { *; }
#
## Application classes that will be serialized/deserialized over Gson
#-keep class com.android.objects.** { *; }
#
## Prevent proguard from stripping interface information from TypeAdapterFactory,
## JsonSerializer, JsonDeserializer instances (so they can be used in @JsonAdapter)
#-keep class * implements com.google.gson.TypeAdapterFactory
#-keep class * implements com.google.gson.JsonSerializer
#-keep class * implements com.google.gson.JsonDeserializer
###---------------End: proguard configuration for Gson  ----------
#
##-keep class !com.android.healper.** { *; }
#-keepclasseswithmembernames,includedescriptorclasses class * {
#    native <methods>;
#}
#-keep class com.flurry.** { *; }
#-dontwarn com.flurry.**
#
#
## Google Play Services library
#-keep class * extends java.util.ListResourceBundle {
#    protected Object[][] getContents();
#}
#
#-keep public class com.google.android.gms.common.internal.safeparcel.SafeParcelable {
#    public static final *** NULL;
#}
#
#-keepnames @com.google.android.gms.common.annotation.KeepName class *
#
#-keepclassmembernames class * {
#    @com.google.android.gms.common.annotation.KeepName *;
#}
#
#-keepnames class * implements android.os.Parcelable {
#    public static final ** CREATOR;
#}
#
##If you are using the Google Mobile Ads SDK, add the following:
## Preserve GMS ads classes
#-keep class com.google.android.gms.common.GooglePlayServicesUtil {*;}
#-keep class com.google.android.gms.ads.identifier.AdvertisingIdClient {*;}
#-keep class com.google.android.gms.ads.identifier.AdvertisingIdClient$Info {*;}
#
#-keep class com.google.android.gms.** { *; }
#-dontwarn com.google.android.gms.**
#-keep class com.google.ads.** {*;}
#
#-keep class com.google.analytics.** { *; }
#-dontwarn com.google.analytics.**
#
#-keep class com.facebook.** { *; }
#-dontwarn com.roughike.bottombar.**
#
#-keep class com.sku.** { *; }
#
## ActionBarSherlock
#
#-keep class android.support.** { *; }
#
#-keep interface android.support.** { *; }
#
#-keep class com.actionbarsherlock.** { *; }
#
#-keep interface com.actionbarsherlock.** { *; }
#
## Keep line numbers to alleviate debugging stack traces
#
#-renamesourcefileattribute SourceFile
#
#-keepattributes SourceFile,LineNumberTable
#
#-keepclassmembers class * implements java.io.Serializable{
#    private static final java.io.ObjectStreamField[] serialPersistentFields;
#    private void writeObject(java.io.ObjectOutputStream);
#    private void readObject(java.io.ObjectInputStream);
#    java.lang.Object writeReplace();
#    java.lang.Object readResolve();
#}
#

#Flutter Wrapper

-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }


##Flutter Wrapper
#-keep class io.flutter.app.** { *; }
#-keep class io.flutter.plugin.**  { *; }
#-keep class io.flutter.util.**  { *; }
#-keep class io.flutter.view.**  { *; }
#-keep class io.flutter.**  { *; }
#-keep class io.flutter.plugins.**  { *; }
#-keep class io.flutter.plugin.editing.** { *; }
#
##Firebase
#-keep class com.google.firebase.** { *; }
#-keep class com.firebase.** { *; }
#-keep class org.apache.** { *; }
#-keepnames class com.fasterxml.jackson.** { *; }
#-keepnames class javax.servlet.** { *; }
#-keepnames class org.ietf.jgss.** { *; }
#-dontwarn org.w3c.dom.**
#-dontwarn org.joda.time.**
#-dontwarn org.shaded.apache.**
#-dontwarn org.ietf.jgss.**
#-keepattributes Signature
#-keepattributes *Annotation*
#-keepattributes EnclosingMethod
#-keepattributes InnerClasses
#-keep class androidx.lifecycle.DefaultLifecycleObserver