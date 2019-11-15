unit Element.Interfaces;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  ISolidFire = interface
    ['{8600BDEE-9BDD-40BD-A388-C40A2D36A959}']
    function Serialize: String;
    procedure Deserialize(AValue: String);
  end;

implementation

end.

