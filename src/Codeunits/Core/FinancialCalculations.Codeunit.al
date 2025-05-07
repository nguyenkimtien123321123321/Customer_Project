codeunit 50303 "Financial Calculations"
{
    procedure CalculateVAT(Amount: Decimal; VATPercentage: Decimal): Decimal
    begin
        exit(Amount * VATPercentage / 100);
    end;

    procedure CalculateLineAmount(Quantity: Decimal; UnitPrice: Decimal): Decimal
    begin
        exit(Quantity * UnitPrice);
    end;

    procedure CalculateDiscountAmount(Amount: Decimal; DiscountPercentage: Decimal): Decimal
    begin
        exit(Amount * DiscountPercentage / 100);
    end;

    procedure CalculateAmountIncludingVAT(Amount: Decimal; VATAmount: Decimal): Decimal
    begin
        exit(Amount + VATAmount);
    end;
}