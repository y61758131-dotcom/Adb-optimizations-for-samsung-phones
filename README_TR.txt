SAMSUNG ADB SAFE OPTIMIZER — TÜRKÇE KILAVUZ
============================================

DOSYALAR
--------
Samsung_ADB_Optimizer.bat : Windows'ta çalıştırılacak menülü dosya.
Samsung_ADB_Commands.txt  : İnsanların okuyabileceği optimizasyon komutları.
Samsung_ADB_Restore.txt   : Ayarları varsayılana döndüren komutlar.

NE YAPAR?
---------
Android'in üç animasyon ölçeğini 0.5x yapar. Arayüz daha çabuk tepki
veriyormuş gibi hissedilebilir. CPU gücünü, kullanılabilir RAM'i veya
oyun FPS'ini doğrudan artırmaz. Samsung/One UI paketlerini devre dışı
bırakmaz; Knox, Telefon, Mesajlar veya sistem uygulamalarını silmez.

NASIL KULLANILIR?
-----------------
1. Windows için resmî Android SDK Platform-Tools'u indirin ve ZIP'i açın:
   https://developer.android.com/tools/releases/platform-tools
2. Bu klasördeki BAT ve TXT dosyalarını platform-tools klasörüne,
   adb.exe ile aynı konuma kopyalayın. Alternatif olarak platform-tools
   klasörünü Windows PATH'e ekleyebilirsiniz.
3. Telefonda Geliştirici seçenekleri > USB hata ayıklama'yı açın.
4. USB ile bağlayın ve telefonda görünen RSA izin penceresini kabul edin.
5. Yalnızca hedef telefon bağlıyken Samsung_ADB_Optimizer.bat dosyasını
   çalıştırın ve ekrandan 1'i seçin.
6. Varsayılan ayarlara dönmek için aynı BAT dosyasını tekrar çalıştırıp 2'yi seçin.

KOMUTLAR NEDEN 'adb shell' İLE BAŞLAMIYOR?
-----------------------------------------
TXT dosyasındaki satırlar doğrudan Android shell komutlarıdır; önlerine
'adb shell' eklenmemelidir. BAT dosyası, tüm TXT dosyasını tek bir shell
oturumunun standart girdisine yönlendirir:

    adb shell < Samsung_ADB_Commands.txt

Bu satır BAT'ın bağlantı/yürütme mekanizmasıdır; TXT'deki komutların
başına 'adb shell' eklenmesi anlamına gelmez.

SINIRLAR VE GÜVENLİK
-------------------
- Bu bir genel ve düşük riskli başlangıç ayarıdır; kapsamlı debloat veya
  performans modu değildir. Model/One UI bilgisi olmadan paket devre dışı
  bırakma listesi eklemek güvenli sayılmaz.
- USB hata ayıklamasını yalnızca güvendiğiniz bilgisayarlarda açın.
- Telefonu değiştirmeden önce önemli verileri yedekleyin.
- Komutlar Android shell yetkileriyle çalışır; root gerektirmez.
- Gerekirse ayarları telefonun Geliştirici seçenekleri ekranından da
  elle değiştirerek animasyon ölçeklerini 1x yapabilirsiniz.
