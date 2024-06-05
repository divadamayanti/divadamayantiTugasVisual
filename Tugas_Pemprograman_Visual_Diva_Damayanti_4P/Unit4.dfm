object DataModule4: TDataModule4
  OldCreateOrder = False
  Left = 192
  Top = 153
  Height = 174
  Width = 260
  object ZConnection: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'db_penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Tugas_Pemprograman_Visual_Siti_Nurhaliza_4P\libmysql.dll'
    Left = 24
    Top = 24
  end
  object Zkategori: TZQuery
    Connection = ZConnection
    SortType = stDescending
    Active = True
    SQL.Strings = (
      'select * from kategori ')
    Params = <>
    Left = 104
    Top = 24
  end
  object dskategori: TDataSource
    DataSet = Zkategori
    Left = 104
    Top = 80
  end
end
