unit Element.AccountInfo;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF FPC}
  Classes, SysUtils, fpjson, jsonparser,
  {$ELSE}
  System.Classes, System.SysUtils, System.Json,
  {$ENDIF}
  Element.Interfaces;

type
  TAccountInfo = class(TInterfacedObject, ISolidFire)
  protected
    FAccountID: Integer;
    FInitiatorSecret: String;
    FTargetSecret: String;
  public
    function Serialize: String;
    procedure Deserialize(AValue: String);
    class function Deserialize(AValue: String): TAccountInfo;
    property AccountID: Integer read FAccountID write FAccountID;
    property InitiatorSecret: String read FInitiatorSecret write FInitiatorSecret;
    property TargetSecret: String read FTargetSecret write FTargetSecret;
  end;

implementation

function TAccountInfo.Serialize: String;
var
  LJsonObject: TJsonObject;
begin
  LJsonObject := TJsonObject.Create;
  try
    {$IFDEF FPC}
    LJsonObject.Add('accountId', FAccountID);
    {$ELSE}
    LJsonObject.AddPair('accountId', TJSonNumber.Create(FAccountID));
    {$ENDIF}
    Result := LJsonObject.AsJson;
  finally
    LJsonObject.Free;
  end;
end;

procedure TAccountInfo.Deserialize(AValue: String);
begin
  //Do nothing!
end;

class function TAccountInfo.Deserialize(AValue: String): TAccountInfo;
begin
  Result := TAccountInfo.Create;
  Result.Deserialize(AValue);
end;

end.

