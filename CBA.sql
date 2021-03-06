USE [master]
GO
/****** Object:  Database [CBA]    Script Date: 03/12/2017 10:55:25 ******/
CREATE DATABASE [CBA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CBA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CBA_Data.mdf' , SIZE = 65536KB , MAXSIZE = UNLIMITED, FILEGROWTH = 4096KB )
 LOG ON 
( NAME = N'CBA_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CBA_Data_log.ldf' , SIZE = 12352KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [CBA] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CBA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CBA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CBA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CBA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CBA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CBA] SET ARITHABORT OFF 
GO
ALTER DATABASE [CBA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CBA] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CBA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CBA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CBA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CBA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CBA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CBA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CBA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CBA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CBA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CBA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CBA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CBA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CBA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CBA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CBA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CBA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CBA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CBA] SET  MULTI_USER 
GO
ALTER DATABASE [CBA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CBA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CBA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CBA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CBA]
GO
/****** Object:  Schema [AP]    Script Date: 03/12/2017 10:55:25 ******/
CREATE SCHEMA [AP]
GO
/****** Object:  Schema [AR]    Script Date: 03/12/2017 10:55:25 ******/
CREATE SCHEMA [AR]
GO
/****** Object:  Schema [BP]    Script Date: 03/12/2017 10:55:25 ******/
CREATE SCHEMA [BP]
GO
/****** Object:  Schema [CO]    Script Date: 03/12/2017 10:55:25 ******/
CREATE SCHEMA [CO]
GO
/****** Object:  Schema [GL]    Script Date: 03/12/2017 10:55:25 ******/
CREATE SCHEMA [GL]
GO
/****** Object:  Schema [PR]    Script Date: 03/12/2017 10:55:25 ******/
CREATE SCHEMA [PR]
GO
/****** Object:  StoredProcedure [AP].[DeleteBill]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[DeleteBill]
@BillID int
AS
DELETE FROM AP.BIL01 WHERE BILLSID =  @BillID



GO
/****** Object:  StoredProcedure [AP].[DeleteBillDetail]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[DeleteBillDetail]
@BillDetailID int
AS
DELETE FROM AP.BLI01 WHERE BLILIID =  @BillDetailID
GO
/****** Object:  StoredProcedure [AP].[DeleteGoodsReceipt]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[DeleteGoodsReceipt]
@GoodsReceiptID int
AS
DELETE FROM AP.GOR01 WHERE GORERID =  @GoodsReceiptID



GO
/****** Object:  StoredProcedure [AP].[DeleteGoodsReceiptDetail]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[DeleteGoodsReceiptDetail]
@GoodsReceiptDetailID int
AS
DELETE FROM AP.GRL01 WHERE GRLLIID =  @GoodsReceiptDetailID



GO
/****** Object:  StoredProcedure [AP].[DeletePurchaseOrder]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[DeletePurchaseOrder]
@PurchaseOrderID int
AS
DELETE FROM AP.POR01 WHERE PORRNID =  @PurchaseOrderID



GO
/****** Object:  StoredProcedure [AP].[DeletePurchaseOrderDetail]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[DeletePurchaseOrderDetail]
@PurchaseOrderDetailID int
AS
DELETE FROM AP.POL01 WHERE POLLIID =  @PurchaseOrderDetailID



GO
/****** Object:  StoredProcedure [AP].[DeleteRequestForQuote]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[DeleteRequestForQuote]
@RequestForQuoteID int
AS
DELETE FROM AP.RFQ01 WHERE RFQPKID =  @RequestForQuoteID



GO
/****** Object:  StoredProcedure [AP].[DeleteRequestForQuoteDetail]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[DeleteRequestForQuoteDetail]
@RequestForQuoteDetailsID int
AS
DELETE FROM AP.RFL01 WHERE RFLLIID =   @RequestForQuoteDetailsID
GO

/****** Object:  StoredProcedure [AP].[InsertBill]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[InsertBill]
 @BillDocumentDate date
,@BillDueDate date
,@BillStatus nvarchar(20)
,@BillNote nvarchar(255)
,@BillLegalEntity int
,@BillBusinessPartner int
,@BillPeriod int
,@BillDocumentType int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AP.BIL01
           (BILDODA
           ,BILDUDA
		   ,BILSTAT
		   ,BILNOTE
		   ,BILLEGA
		   ,BILBPAR
		   ,BILPERI
		   ,BILDOTY
            )
     VALUES
           (@BillDocumentDate
           ,@BillDueDate
           ,@BillStatus
		   ,@BillNote
		   ,@BillLegalEntity
		   ,@BillBusinessPartner
		   ,@BillPeriod
		   ,@BillDocumentType
           );
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AP].[InsertBillDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[InsertBillDetails]
 @Quantity int
,@Price money
,@TaxeID int
,@ProductID int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AP.BLI01
           (BLILQUA
           ,BLILPRI
		   ,BLITAID
		   ,BLILPRO
            )
     VALUES
           (@Quantity
           ,@Price
           ,@TaxeID
           ,@ProductID);
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AP].[InsertGoodsReceipt]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[InsertGoodsReceipt]
 @GoodsReceiptDocumentDate date
,@GoodsReceiptStatus nvarchar(20)
,@GoodsReceiptNote nvarchar(255)
,@GoodsReceiptLegalEntity int
,@GoodsReceiptBusinessPartner int
,@GoodsReceiptPeriod int
,@GoodsReceiptDocumentType int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AP.GOR01
           (GORDODA
		   ,GORSTAT
		   ,GORNOTE
		   ,GORLEGA
		   ,GORBPAR
		   ,GORPERI
		   ,GORDOTY
            )
     VALUES
           (@GoodsReceiptDocumentDate
           ,@GoodsReceiptStatus
		   ,@GoodsReceiptNote
		   ,@GoodsReceiptLegalEntity
		   ,@GoodsReceiptBusinessPartner
		   ,@GoodsReceiptPeriod
		   ,@GoodsReceiptDocumentType
           );
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AP].[InsertGoodsReceiptDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[InsertGoodsReceiptDetails]
 @Quantity int
,@Price money
,@TaxeID int
,@ProductID int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AP.GRL01
           (GRLLQUA
           ,GRLLPRI
		   ,GRLTAID
		   ,GRLLPRO
            )
     VALUES
           (@Quantity
           ,@Price
           ,@TaxeID
           ,@ProductID);
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AP].[InsertPurchaseOrder]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[InsertPurchaseOrder]

 @PurchaseOrderDocumentDate date
,@PurchaseOrderStatus nvarchar(20)
,@PurchaseOrderNote nvarchar(255)
,@PurchaseOrderLegalEntity int
,@PurchaseOrderBusinessPartner int
,@PurchaseOrderPeriod int
,@PurchaseOrderDocumentType int

AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AP.POR01
           (PORDATE
		   ,PORSTAT
		   ,PORNOTE
		   ,PORLEGA
		   ,PORBPAR
		   ,PORPERI
		   ,PORDOTY
            )
     VALUES
           (@PurchaseOrderDocumentDate
           ,@PurchaseOrderStatus
		   ,@PurchaseOrderNote
		   ,@PurchaseOrderLegalEntity
		   ,@PurchaseOrderBusinessPartner
		   ,@PurchaseOrderPeriod
		   ,@PurchaseOrderDocumentType
           );
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AP].[InsertPurchaseOrderDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[InsertPurchaseOrderDetails]
 @Quantity int
,@Price money
,@TaxeID int
,@ProductID int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AP.POL01
           (POLLQUA
           ,POLLPRI
		   ,POLTAID
		   ,POLLPRO
            )
     VALUES
           (@Quantity
           ,@Price
           ,@TaxeID
           ,@ProductID);
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AP].[InsertRequestForQuote]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[InsertRequestForQuote]
 @RequestForQuoteDocumentDate date
,@RequestForQuoteStatus nvarchar(20)
,@RequestForQuoteNote nvarchar(255)
,@RequestForQuoteLegalEntity int
,@RequestForQuoteBusinessPartner int
,@RequestForQuotePeriod int
,@RequestForQuoteDocumentType int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AP.RFQ01
           (RFQDATE
		   ,RFQSTAT
		   ,RFQNOTE
		   ,RFQLEGA
		   ,RFQBPAR
		   ,RFQPERI
		   ,RFQDOTY
            )
     VALUES
           (@RequestForQuoteDocumentDate
           ,@RequestForQuoteStatus
		   ,@RequestForQuoteNote
		   ,@RequestForQuoteLegalEntity
		   ,@RequestForQuoteBusinessPartner
		   ,@RequestForQuotePeriod
		   ,@RequestForQuoteDocumentType
           );
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AP].[InsertRequestForQuoteDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[InsertRequestForQuoteDetails]
 @Quantity int
,@Price money
,@TaxeID int
,@ProductID int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AP.RFL01
           (RFLLQUA
           ,RFLLPRI
		   ,RFLTAID
		   ,RFLLPRO
            )
     VALUES
           (@Quantity
           ,@Price
           ,@TaxeID
           ,@ProductID);
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AP].[InsertVendor]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[InsertVendor]
 @VendorCode nvarchar(20)
,@VendorName nvarchar(80)
,@VendorAccount int
,@VendorOrganization int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AP.VEN01
           (VENCODE
           ,VENNAME
		   ,VENACCO
		   ,VENORGA
            )
     VALUES
           (@VendorCode
           ,@VendorName
           ,@VendorAccount
		   ,@VendorOrganization
           );
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AP].[UpdateBill]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[UpdateBill]
 @BillID int
,@BillDocumentDate date
,@BillDueDate date
,@BillStatus nvarchar(20)
,@BillNote nvarchar(255)
,@BillLegalEntity int
,@BillBusinessPartner int
,@BillPeriod int
,@BillDocumentType int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AP.BIL01 SET 
 BILDODA = @BillDocumentDate
,BILDUDA = @BillDueDate
,BILSTAT = @BillStatus
,BILNOTE = @BillNote
,BILLEGA = @BillLegalEntity
,BILBPAR = @BillBusinessPartner
,BILPERI = @BillPeriod
,BILDOTY = @BillDocumentType
WHERE BILLSID =  @BillID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AP].[UpdateBillDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[UpdateBillDetails]
 @BillDetailsID int
,@Quantity int
,@Price money
,@TaxeID int
,@ProductID int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AP.BLI01 SET  BLILQUA = @Quantity , BLILPRI = @Price , BLILPRO =  @ProductID, BLITAID = @TaxeID 
WHERE BLILIID =  @BillDetailsID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AP].[UpdateGoodsReceipt]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[UpdateGoodsReceipt]
 @GoodsReceiptID int
,@GoodsReceiptDocumentDate date
,@GoodsReceiptStatus nvarchar(20)
,@GoodsReceiptNote nvarchar(255)
,@GoodsReceiptLegalEntity int
,@GoodsReceiptBusinessPartner int
,@GoodsReceiptPeriod int
,@GoodsReceiptDocumentType int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AP.GOR01 SET 
 GORDODA = @GoodsReceiptDocumentDate
,GORSTAT = @GoodsReceiptStatus
,GORNOTE = @GoodsReceiptNote
,GORLEGA = @GoodsReceiptLegalEntity
,GORBPAR = @GoodsReceiptBusinessPartner
,GORPERI = @GoodsReceiptPeriod
,GORDOTY = @GoodsReceiptDocumentType
WHERE GORERID =  @GoodsReceiptID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AP].[UpdateGoodsReceiptDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[UpdateGoodsReceiptDetails]
 @GoodsReceiptDetailsID int
,@Quantity int
,@Price money
,@TaxeID int
,@ProductID int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AP.GRL01 SET  GRLLQUA = @Quantity, GRLLPRI = @Price, GRLLPRO =  @ProductID, GRLTAID = @TaxeID 
WHERE GRLLIID =  @GoodsReceiptDetailsID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AP].[UpdatePurchaseOrder]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[UpdatePurchaseOrder]
 @PurchaseOrderID int
,@PurchaseOrderDocumentDate date
,@PurchaseOrderStatus nvarchar(20)
,@PurchaseOrderNote nvarchar(255)
,@PurchaseOrderLegalEntity int
,@PurchaseOrderBusinessPartner int
,@PurchaseOrderPeriod int
,@PurchaseOrderDocumentType int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AP.POR01 SET  
 PORDATE = @PurchaseOrderDocumentDate
,PORSTAT = @PurchaseOrderStatus
,PORNOTE = @PurchaseOrderNote
,PORLEGA = @PurchaseOrderLegalEntity
,PORBPAR = @PurchaseOrderBusinessPartner
,PORPERI = @PurchaseOrderPeriod
,PORDOTY = @PurchaseOrderDocumentType
WHERE PORRNID =  @PurchaseOrderID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AP].[UpdatePurchaseOrderDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[UpdatePurchaseOrderDetails]
 @PurchaseOrderDetailsID int
,@Quantity int 
,@Price money
,@ProductID int
,@TaxeID int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AP.POL01 SET  POLLQUA = @Quantity , POLLPRI = @Price , POLLPRO =  @ProductID, POLTAID =@TaxeID
WHERE POLLIID =  @PurchaseOrderDetailsID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AP].[UpdateRequestForQuote]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[UpdateRequestForQuote]
 @RequestForQuoteID int
,@RequestForQuoteDocumentDate date
,@RequestForQuoteStatus nvarchar(20)
,@RequestForQuoteNote nvarchar(255)
,@RequestForQuoteLegalEntity int
,@RequestForQuoteBusinessPartner int
,@RequestForQuotePeriod int
,@RequestForQuoteDocumentType int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AP.RFQ01 SET 
 RFQDATE = @RequestForQuoteDocumentDate
,RFQSTAT = @RequestForQuoteStatus
,RFQNOTE = @RequestForQuoteNote
,RFQLEGA = @RequestForQuoteLegalEntity
,RFQBPAR = @RequestForQuoteBusinessPartner
,RFQPERI = @RequestForQuotePeriod
,RFQDOTY = @RequestForQuoteDocumentType
WHERE RFQPKID =  @RequestForQuoteID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [AP].[UpdateRequestForQuoteDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AP].[UpdateRequestForQuoteDetails]
 @RequestForQuoteDetailsID int
,@Quantity int
,@Price money
,@TaxeID int
,@ProductID int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AP.RFL01 SET  RFLLQUA = @Quantity , RFLLPRI = @Price , RFLLPRO =  @ProductID, RFLTAID = @TaxeID 
WHERE RFLLIID =  @RequestForQuoteDetailsID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO

/****** Object:  StoredProcedure [AR].[DeleteInvoice]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[DeleteInvoice]
@InvoiceID int
AS
DELETE FROM AR.INV01 WHERE INVOIID =  @InvoiceID



GO
/****** Object:  StoredProcedure [AR].[DeleteInvoiceDetail]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[DeleteInvoiceDetail]
@InvoiceDetailsID int
AS
DELETE FROM AR.INL01 WHERE INLLIID =  @InvoiceDetailsID
GO
/****** Object:  StoredProcedure [AR].[DeleteQuote]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[DeleteQuote]
@QuoteID int
AS
DELETE FROM AR.QUO01 WHERE QUOTEID =  @QuoteID



GO
/****** Object:  StoredProcedure [AR].[DeleteQuoteDetail]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[DeleteQuoteDetail]
@QuoteDetailsID int
AS
DELETE FROM AR.QLI01 WHERE QLILIID =   @QuoteDetailsID
GO
/****** Object:  StoredProcedure [AR].[DeleteSaleOrder]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[DeleteSaleOrder]
@SaleOrderID int
AS
DELETE FROM AR.SOR01 WHERE SORDRID =  @SaleOrderID



GO
/****** Object:  StoredProcedure [AR].[DeleteSaleOrderDetail]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[DeleteSaleOrderDetail]
@SaleOrderDetailsID int
AS
DELETE FROM AR.SOL01 WHERE SOLLIID =   @SaleOrderDetailsID
GO
/****** Object:  StoredProcedure [AR].[DeleteShipping]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[DeleteShipping]
@ShippingID int
AS
DELETE FROM AR.SHI01 WHERE SHIPMID =  @ShippingID



GO
/****** Object:  StoredProcedure [AR].[DeleteShippingDetail]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[DeleteShippingDetail]
@ShippingDetailsID int
AS
DELETE FROM AR.SHL01 WHERE SHLLIID =  @ShippingDetailsID
GO
/****** Object:  StoredProcedure [AR].[InsertInvoice]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[InsertInvoice]
 @InvoiceDocumentDate date
,@InvoiceStatus nvarchar(20)
,@InvoiceNote nvarchar(255)
,@InvoiceLegalEntity int
,@InvoiceBusinessPartner int
,@InvoicePeriod int
,@InvoiceDocumentType int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AR.INV01
           (INVDODA
		   ,INVSTAT
		   ,INVNOTE
		   ,INVLEGA
		   ,INVBPAR
		   ,INVPERI
		   ,INVDOTY
            )
     VALUES
           (@InvoiceDocumentDate
           ,@InvoiceStatus
		   ,@InvoiceNote
		   ,@InvoiceLegalEntity
		   ,@InvoiceBusinessPartner
		   ,@InvoicePeriod
		   ,@InvoiceDocumentType
           );
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AR].[InsertInvoiceDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[InsertInvoiceDetails]
 @Quantity int
,@Price money
,@TaxeID int
,@ProductID int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AR.INL01
           (INLLQUA
           ,INLLPRI
		   ,INLTAID
		   ,INLLPRO
            )
     VALUES
           (@Quantity
           ,@Price
           ,@TaxeID
           ,@ProductID);
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AR].[InsertQuote]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[InsertQuote]
 @QuoteDocumentDate date
,@QuoteStatus nvarchar(20)
,@QuoteNote nvarchar(255)
,@QuoteLegalEntity int
,@QuoteBusinessPartner int
,@QuotePeriod int
,@QuoteDocumentType int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AR.QUO01
           (QUODODA
		   ,QUOSTAT
		   ,QUONOTE
		   ,QUOLEGA
		   ,QUOBPAR
		   ,QUOPERI
		   ,QUODOTY
            )
     VALUES
           (@QuoteDocumentDate
           ,@QuoteStatus
		   ,@QuoteNote
		   ,@QuoteLegalEntity
		   ,@QuoteBusinessPartner
		   ,@QuotePeriod
		   ,@QuoteDocumentType
           );
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AR].[InsertQuoteDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[InsertQuoteDetails]
 @Quantity int
,@Price money
,@TaxeID int
,@ProductID int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AR.QLI01
           (QLILQUA
           ,QLILPRI
		   ,QLITAID
		   ,QLILPRO
            )
     VALUES
           (@Quantity
           ,@Price
           ,@TaxeID
           ,@ProductID);
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AR].[InsertSaleOrder]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[InsertSaleOrder]
 @SaleOrderDocumentDate date
,@SaleOrderStatus nvarchar(20)
,@SaleOrderNote nvarchar(255)
,@SaleOrderLegalEntity int
,@SaleOrderBusinessPartner int
,@SaleOrderPeriod int
,@SaleOrderDocumentType int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AR.SOR01
           (SORDODA
		   ,SORSTAT
		   ,SORNOTE
		   ,SORLEGA
		   ,SORBPAR
		   ,SORPERI
		   ,SORDOTY
            )
     VALUES
           (@SaleOrderDocumentDate
           ,@SaleOrderStatus
		   ,@SaleOrderNote
		   ,@SaleOrderLegalEntity
		   ,@SaleOrderBusinessPartner
		   ,@SaleOrderPeriod
		   ,@SaleOrderDocumentType
           );
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AR].[InsertSaleOrderDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[InsertSaleOrderDetails]
 @Quantity int
,@Price money
,@TaxeID int
,@ProductID int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AR.SOL01
           (SOLLQUA
           ,SOLLPRI
		   ,SOLTAID
		   ,SOLLPRO
            )
     VALUES
           (@Quantity
           ,@Price
           ,@TaxeID
           ,@ProductID);
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AR].[InsertShipping]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[InsertShipping]
 @ShippingDocumentDate date
,@ShippingStatus nvarchar(20)
,@ShippingNote nvarchar(255)
,@ShippingLegalEntity int
,@ShippingBusinessPartner int
,@ShippingrPeriod int
,@ShippingDocumentType int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AR.SHI01
           (SHIDODA
		   ,SHISTAT
		   ,SHINOTE
		   ,SHILEGA
		   ,SHIBPAR
		   ,SHIPERI
		   ,SHIDOTY
            )
     VALUES
           (@ShippingDocumentDate
           ,@ShippingStatus
		   ,@ShippingNote
		   ,@ShippingLegalEntity
		   ,@ShippingBusinessPartner
		   ,@ShippingrPeriod
		   ,@ShippingDocumentType
           );
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AR].[InsertShippingDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[InsertShippingDetails]
 @Quantity int
,@Price money
,@TaxeID int
,@ProductID int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO AR.SHL01
           (SHLLQUA
           ,SHLLPRI
		   ,SHLTAID
		   ,SHLLPRO
            )
     VALUES
           (@Quantity
           ,@Price
           ,@TaxeID
           ,@ProductID);
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AR].[UpdateInvoice]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[UpdateInvoice]
 @InvoiceID int
,@InvoiceDocumentDate date
,@InvoiceStatus nvarchar(20)
,@InvoiceNote nvarchar(255)
,@InvoiceLegalEntity int
,@InvoiceBusinessPartner int
,@InvoicePeriod int
,@InvoiceDocumentType int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AR.INV01 SET 
 INVDODA = @InvoiceDocumentDate
,INVSTAT = @InvoiceStatus
,INVNOTE = @InvoiceNote
,INVLEGA = @InvoiceLegalEntity
,INVBPAR = @InvoiceBusinessPartner
,INVPERI = @InvoicePeriod
,INVDOTY = @InvoiceDocumentType
WHERE INVOIID =  @InvoiceID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [AR].[UpdateInvoiceDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[UpdateInvoiceDetails]
 @InvoiceDetailsID int
,@Quantity int
,@Price money
,@TaxeID int
,@ProductID int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AR.INL01 SET  INLLQUA = @Quantity , INLLPRI = @Price , INLLPRO =  @ProductID, INLTAID = @TaxeID 
WHERE INLLIID =  @InvoiceDetailsID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AR].[UpdateQuote]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[UpdateQuote]
 @QuoteID int
,@QuoteDocumentDate date
,@QuoteStatus nvarchar(20)
,@QuoteNote nvarchar(255)
,@QuoteLegalEntity int
,@QuoteBusinessPartner int
,@QuotePeriod int
,@QuoteDocumentType int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AR.QUO01 SET 
 QUODODA = @QuoteDocumentDate
,QUOSTAT = @QuoteStatus
,QUONOTE = @QuoteNote
,QUOLEGA = @QuoteLegalEntity
,QUOBPAR = @QuoteBusinessPartner
,QUOPERI = @QuotePeriod
,QUODOTY = @QuoteDocumentType
WHERE QUOTEID =  @QuoteID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [AR].[UpdateQuoteDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[UpdateQuoteDetails]
 @QuoteDetailsID int
,@Quantity int
,@Price money
,@TaxeID int
,@ProductID int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AR.QLI01 SET  QLILQUA = @Quantity , QLILPRI = @Price , QLILPRO =  @ProductID, QLITAID = @TaxeID 
WHERE QLILIID =  @QuoteDetailsID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AR].[UpdateSaleOrder]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[UpdateSaleOrder]
 @SaleOrderID int
,@SaleOrderDocumentDate date
,@SaleOrderStatus nvarchar(20)
,@SaleOrderNote nvarchar(255)
,@SaleOrderLegalEntity int
,@SaleOrderBusinessPartner int
,@SaleOrderPeriod int
,@SaleOrderDocumentType int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AR.SOR01 SET 
 SORDODA = @SaleOrderDocumentDate
,SORSTAT = @SaleOrderStatus
,SORNOTE = @SaleOrderNote
,SORLEGA = @SaleOrderLegalEntity
,SORBPAR = @SaleOrderBusinessPartner
,SORPERI = @SaleOrderPeriod
,SORDOTY = @SaleOrderDocumentType
WHERE SORDRID =  @SaleOrderID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [AR].[UpdateSaleOrderDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[UpdateSaleOrderDetails]
 @SaleOrderDetailsID int
,@Quantity int
,@Price money
,@TaxeID int
,@ProductID int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AR.SOL01 SET  SOLLQUA = @Quantity , SOLLPRI = @Price , SOLLPRO =  @ProductID, SOLTAID = @TaxeID 
WHERE SOLLIID =  @SaleOrderDetailsID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [AR].[UpdateShipping]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[UpdateShipping]
 @ShippingID int
,@ShippingDocumentDate date
,@ShippingStatus nvarchar(20)
,@ShippingNote nvarchar(255)
,@ShippingLegalEntity int
,@ShippingBusinessPartner int
,@ShippingPeriod int
,@ShippingDocumentType int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AR.SHI01 SET 
 SHIDODA = @ShippingDocumentDate
,SHISTAT = @ShippingStatus
,SHINOTE = @ShippingNote
,SHILEGA = @ShippingLegalEntity
,SHIBPAR = @ShippingBusinessPartner
,SHIPERI = @ShippingPeriod
,SHIDOTY = @ShippingDocumentType
WHERE SHIPMID =  @ShippingID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [AR].[UpdateShippingDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AR].[UpdateShippingDetails]
 @ShippingDetailsID int
,@Quantity int
,@Price money
,@TaxeID int
,@ProductID int
AS
BEGIN TRY
BEGIN TRAN
UPDATE AR.SHL01 SET  SHLLQUA = @Quantity , SHLLPRI = @Price , SHLLPRO =  @ProductID, SHLTAID = @TaxeID 
WHERE SHLLIID =  @ShippingDetailsID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [BP].[DeleteBusinessPartner]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [BP].[DeleteBusinessPartner]
@BusinessPartnerID int
AS
DELETE FROM BP.BPA01 WHERE BUSIPID = @BusinessPartnerID



GO
/****** Object:  StoredProcedure [BP].[DeleteBusinessPartnerAddress]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [BP].[DeleteBusinessPartnerAddress]
		@BusinessPartnerAddressID int
	    AS
		DELETE FROM BP.BPD01 WHERE BPDREID = @BusinessPartnerAddressID


GO
/****** Object:  StoredProcedure [BP].[InsertBusinessPartner]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [BP].[InsertBusinessPartner]
 @BusinessPartnerCode nvarchar(20)
,@BusinessPartnerName nvarchar(80)
,@BusinessPartnerType nvarchar(20)
,@BusinessPartnerLegalEntity int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO BP.BPA01
           (BUSICOD
           ,BUSINAM
		   ,BUSITYP
		   ,BUSTLEG
		   )
     VALUES
           (@BusinessPartnerCode
           ,@BusinessPartnerName
           ,@BusinessPartnerType
		   ,@BusinessPartnerLegalEntity
           );
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [BP].[InsertBusinessPartnerAddress]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [BP].[InsertBusinessPartnerAddress]
 @BusinessPartnerAddressType nvarchar(50)
,@BusinessPartnerAddressCity nvarchar(50)
,@BusinessPartnerAdressStreet nvarchar(50)
,@BusinessPartnerAddressStateRegion nvarchar(200)
,@BusinessPartnerAddressCountry nvarchar(50)
,@BusinessPartnerID int
AS
INSERT INTO BP.BPD01
           (BPDRTYP
           ,BPDRCIT
           ,BPDRSTR
           ,BPDRSTA
           ,BPDRCOU 
		   ,BPDRBPI
           )
     VALUES
           (@BusinessPartnerAddressType
           ,@BusinessPartnerAddressCity
           ,@BusinessPartnerAdressStreet
           ,@BusinessPartnerAddressStateRegion
           ,@BusinessPartnerAddressCountry
		   ,@BusinessPartnerID
           )


GO
/****** Object:  StoredProcedure [BP].[UpdateBusinessPartner]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [BP].[UpdateBusinessPartner]
 @BusinessPartnerID int
,@BusinessPartnerCode nvarchar(20) 
,@BusinessPartnerName nvarchar(80) 
,@BusinessPartnerType nvarchar(20)
,@BusinessPartnerLegalEntity int
AS
BEGIN TRY
BEGIN TRAN
DECLARE @UpdatedDate date = GETDATE()
UPDATE BP.BPA01 SET  BUSICOD = @BusinessPartnerCode, BUSINAM = @BusinessPartnerName , BUSITYP =  @BusinessPartnerType, BUSTLEG = @BusinessPartnerLegalEntity, BUSIUDO = @UpdatedDate
WHERE BUSIPID =  @BusinessPartnerID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [BP].[UpdateBusinessPartnerAddress]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [BP].[UpdateBusinessPartnerAddress]
	 @BusinessPartnerAddressID int
	,@BusinessPartnerAddressType nvarchar(50) 
	,@BusinessPartnerAddressCity nvarchar(50) 
    ,@BusinessPartnerAdressStreet nvarchar(50) 
    ,@BusinessPartnerAddressStateRegion nvarchar(200) 
    ,@BusinessPartnerAddressCountry nvarchar(50)
	,@BusinessPartnerID int

    	AS
		DECLARE @UpdatedDate date = GETDATE()
		UPDATE BP.BPD01 SET  BPDRTYP = @BusinessPartnerAddressType, BPDRCIT = @BusinessPartnerAddressCity  ,  BPDRSTR = @BusinessPartnerAdressStreet    , BPDRSTA = @BusinessPartnerAddressStateRegion  , BPDRCOU = @BusinessPartnerAddressCountry, BPDRBPI = @BusinessPartnerID , BUSIUDO = @UpdatedDate
		WHERE BPDREID = @BusinessPartnerAddressID

GO
/****** Object:  StoredProcedure [CO].[DeleteAddress]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [CO].[DeleteAddress]
		@AddressID int
	    AS
		DELETE FROM GL.ADD01 WHERE ADDREID = @AddressID


GO
/****** Object:  StoredProcedure [CO].[DeleteBank]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [CO].[DeleteBank]
@BankID int
AS
DELETE FROM CO.BAN01 WHERE BANKSID = @BankID

GO
/****** Object:  StoredProcedure [CO].[DeleteLegalEntity]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [CO].[DeleteLegalEntity]
@LegalEntityID int
AS
DELETE FROM CO.LEG01 WHERE LEGALID = @LegalEntityID

GO
/****** Object:  StoredProcedure [CO].[InsertAddress]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [CO].[InsertAddress]
 @AddressType nvarchar(50)
,@AddressCity nvarchar(50)
,@AdressStreet nvarchar(50)
,@AddressStateRegion nvarchar(200)
,@AddressCountry nvarchar(50)
AS
INSERT INTO GL.ADD01
           (ADDRTYP
           , ADDRCIT
           , ADDRSTR
           , ADDRSTA
           , ADDRCOU 
           )
     VALUES
           (@AddressType
           ,@AddressCity
           ,@AdressStreet
           ,@AddressStateRegion
           ,@AddressCountry
           )


GO
/****** Object:  StoredProcedure [CO].[InsertBank]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [CO].[InsertBank]
 @BankCode nvarchar(255)
,@BankName nvarchar(255)
,@BankTerritory nvarchar(255)

AS
INSERT INTO CO.BAN01
           (
		    BANKCOD
           ,BANKNAM
           ,BANKTER
		   )
     VALUES
           (@BankCode
           ,@BankName
           ,@BankTerritory
		   )


GO
/****** Object:  StoredProcedure [CO].[InsertLegalEntity]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [CO].[InsertLegalEntity]
 @LegalEntityName nvarchar(255)
,@LegalEntityRegistrationID nvarchar(255)
,@LegalEntityFiscalID nvarchar(255)
,@LegalEntityChart int
,@LegalEntityHeadQuarters int
AS
INSERT INTO CO.LEG01
           (
		    LEGALNA
           ,LEGALEG
           ,LEGALIS
		   ,LEGALCA
		   ,LEGALHE)
     VALUES
           (@LegalEntityName
           ,@LegalEntityRegistrationID
           ,@LegalEntityFiscalID
           ,@LegalEntityChart
           ,@LegalEntityHeadQuarters)


GO
/****** Object:  StoredProcedure [CO].[UpdateAddress]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [CO].[UpdateAddress]
	 @AddressID int
	,@AddressType nvarchar(50) 
	,@AddressCity nvarchar(50) 
    ,@AdressStreet nvarchar(50) 
    ,@AddressStateRegion nvarchar(200) 
    ,@AddressCountry nvarchar(50)

    	AS
		DECLARE @UpdatedDate date = GETDATE()
		UPDATE ADD01 SET  ADDRTYP = @AddressType, ADDRCIT = @AddressCity  ,  ADDRSTR = @AdressStreet    , ADDRSTA = @AddressStateRegion  , ADDRCOU = @AddressCountry, ADDRUAT = @UpdatedDate
		WHERE ADDREID = @AddressID

GO
/****** Object:  StoredProcedure [CO].[UpdateBank]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [CO].[UpdateBank]
 @BankID int
,@BankCode nvarchar(255) 
,@BankName nvarchar(255) 
,@BankTerritory nvarchar(255) 

AS
DECLARE @UpdatedDate date = GETDATE() 
UPDATE BAN01 SET BANKCOD = @BankCode , BANKNAM = @BankName   ,  BANKTER = @BankTerritory , BANKUAT =  @UpdatedDate
WHERE BANKSID = @BankID



GO
/****** Object:  StoredProcedure [CO].[UpdateLegalEntity]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [CO].[UpdateLegalEntity]
 @LegalEntityID int
,@LegalEntityName nvarchar(255) 
,@LegalEntityRegistrationID nvarchar(255) 
,@LegalEntityFiscalID nvarchar(255) 
,@LegalEntityChart int 
,@LegalEntityHeadQuarters int 
AS
DECLARE @UpdatedDate date = GETDATE() 
UPDATE LEG01 SET LEGALNA = @LegalEntityName   ,  LEGALEG = @LegalEntityRegistrationID  , LEGALIS = @LegalEntityFiscalID  , LEGALCA = @LegalEntityChart  , LEGALHE = @LegalEntityHeadQuarters   , LEGALPD =  @UpdatedDate
WHERE LEGALID = @LegalEntityID



GO
/****** Object:  StoredProcedure [dbo].[uspLogError]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- uspLogError logs error information in the ErrorLog table about the 
-- error that caused execution to jump to the CATCH block of a 
-- TRY...CATCH construct. This should be executed from within the scope 
-- of a CATCH block otherwise it will return without inserting error 
-- information. 
CREATE PROCEDURE [dbo].[uspLogError] 
    @ErrorLogID [int] = 0 OUTPUT -- contains the ErrorLogID of the row inserted
AS                               -- by uspLogError in the ErrorLog table
BEGIN
    SET NOCOUNT ON;

    -- Output parameter value of 0 indicates that error 
    -- information was not logged
    SET @ErrorLogID = 0;

    BEGIN TRY
        -- Return if there is no error information to log
        IF ERROR_NUMBER() IS NULL
            RETURN;

        -- Return if inside an uncommittable transaction.
        -- Data insertion/modification is not allowed when 
        -- a transaction is in an uncommittable state.
        IF XACT_STATE() = -1
        BEGIN
            PRINT 'Cannot log error since the current transaction is in an uncommittable state. ' 
                + 'Rollback the transaction before executing uspLogError in order to successfully log error information.';
            RETURN;
        END;

        INSERT [dbo].[ErrorLog] 
            (
            [UserName], 
            [ErrorNumber], 
            [ErrorSeverity], 
            [ErrorState], 
            [ErrorProcedure], 
            [ErrorLine], 
            [ErrorMessage]
            ) 
        VALUES 
            (
            CONVERT(sysname, CURRENT_USER), 
            ERROR_NUMBER(),
            ERROR_SEVERITY(),
            ERROR_STATE(),
            ERROR_PROCEDURE(),
            ERROR_LINE(),
            ERROR_MESSAGE()
            );

        -- Pass back the ErrorLogID of the row inserted
        SET @ErrorLogID = @@IDENTITY;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred in stored procedure uspLogError: ';
        EXECUTE [dbo].[uspPrintError];
        RETURN -1;
    END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[uspPrintError]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- uspPrintError prints error information about the error that caused 
-- execution to jump to the CATCH block of a TRY...CATCH construct. 
-- Should be executed from within the scope of a CATCH block otherwise 
-- it will return without printing any error information.
CREATE PROCEDURE [dbo].[uspPrintError] 
AS
BEGIN
    SET NOCOUNT ON;

    -- Print error information. 
    PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
          ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
          ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
          ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
          ', Line ' + CONVERT(varchar(5), ERROR_LINE());
    PRINT ERROR_MESSAGE();
END;

GO
/****** Object:  StoredProcedure [GL].[DeleteAccount]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [GL].[DeleteAccount]
		@AccountID int
	    AS
		DELETE FROM ACC01 WHERE ACCNTCD=@AccountID


GO
/****** Object:  StoredProcedure [GL].[DeleteBudget]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[DeleteBudget]
 @BudgetID int
AS
DELETE FROM BUD01 WHERE BUDGETI =  @BudgetID



GO
/****** Object:  StoredProcedure [GL].[DeleteCalendar]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[DeleteCalendar]
	(
	@CalendarId int
	)
AS
BEGIN 

	DECLARE @numofperiods INT;

	SET @numofperiods  = (SELECT COUNT(*) FROM GL.PER01 WHERE PERIODC =  @CalendarId);

	IF @numofperiods >= 1 

	RAISERROR (50005, -- Message id.
           10, -- Severity,
           1, -- State,
           N'Cannot delete calendar with periods'); -- First argument supplies the string.

	ELSE 
	
	DELETE FROM GL.CAL01 WHERE CALENID = @CalendarId;

END


GO
/****** Object:  StoredProcedure [GL].[DeleteChart]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[DeleteChart]
 @ChartID int

AS

	DECLARE @numofaccounts int;

	SET @numofaccounts = (SELECT COUNT(*) FROM GL.ACC01 WHERE ACCNTCA =  @ChartID);

	IF @numofaccounts >= 1 

	RAISERROR (50005, -- Message id.
           10, -- Severity,
           1, -- State,
           N'Cannot delete chart with accounts'); -- First argument supplies the string.

	ELSE 

	DELETE FROM CHA01 WHERE COASIDS = @ChartID


GO
/****** Object:  StoredProcedure [GL].[DeleteJournal]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[DeleteJournal]
 @JournalID int
AS  
DELETE FROM JHE01 WHERE JOURNID =  @JournalID

GO

/****** Object:  StoredProcedure [GL].[DeletePeriod]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[DeletePeriod]
 @PeriodID int
AS
DELETE FROM PER01 WHERE PERIODI = @PeriodID

GO
/****** Object:  StoredProcedure [GL].[DeleteRate]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[DeleteRate]
	(
                 @RateId int

	)
AS

  DELETE FROM GL.RAT01  WHERE RATEIDS  = @RateId

GO
/****** Object:  StoredProcedure [GL].[DeleteSegment]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[DeleteSegment]
 @SegmentId int
AS
DELETE FROM GL.ACS01 WHERE ACSTSID = @SegmentId

GO
/****** Object:  StoredProcedure [GL].[DeleteTax]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[DeleteTax]
 @TaxID int
AS
DELETE FROM GL.TAX01 WHERE TAXCODE = @TaxID


GO
/****** Object:  StoredProcedure [GL].[InsertAccount]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[InsertAccount]
(
 @AccountChart int
,@AccountCode nvarchar(255)
,@AccountName nvarchar(255)
,@Description nvarchar(255)
,@AccountType nvarchar(20)
,@AccountPosting char(1)
,@AccountBudgeting char(1)
,@AccountStatus char(1)
,@AccountLevel int
,@AccountParent nvarchar(255)
)
AS
INSERT INTO GL.ACC01
           (
		    ACCNTCA
		   ,ACCNTNB
           ,ACCNTNM
		   ,ACCNTDE
           ,ACCNTTP
           ,ACCNTPO
           ,ACCNTBU
           ,ACCNTST
           ,ACCNTLE
		   ,ACCNTPA
		   )
     VALUES
           (
		     @AccountChart
		    ,@AccountCode 
            ,@AccountName
			,@Description 
			,@AccountType 
            ,@AccountPosting
            ,@AccountBudgeting
            ,@AccountStatus
            ,@AccountLevel
			,@AccountParent
           )


GO
/****** Object:  StoredProcedure [GL].[InsertBudget]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[InsertBudget]
 @BudgetName nvarchar(50)
,@BudgetDescription nvarchar(255)
,@BudgetStatus nvarchar(20)
,@BudgetCalendar int
,@BudgetLedger int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO GL.BUD01
           (BUDGETN
           ,BUDGETD
		   ,BUDGETS
		   ,BUDGECA
		   ,BUDGETL
            )
     VALUES
           (@BudgetName
           ,@BudgetDescription
           ,@BudgetStatus
		   ,@BudgetCalendar
		   ,@BudgetLedger
           );
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [GL].[InsertBudgetDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[InsertBudgetDetails]
(
 @BudgetID int
,@Amount money
,@Account int
,@Period int
)
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO GL.BUL01
           (
		    BULLIBU
		   ,BULLIAM
		   ,BULLACC
           ,BULLPER
		   )
     VALUES
           (
		     @BudgetID
		    ,@Amount
            ,@Account
			,@Period 
           )
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [GL].[InsertCalendar]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[InsertCalendar]
 @CalendarName varchar(80)
,@CalendarStatus varchar(80)
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO [GL].[CAL01]
           (CALENDN
           ,CALENDS
		   )
     VALUES
           (@CalendarName
           ,@CalendarStatus)

COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [GL].[InsertChart]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[InsertChart]
 @ChartName varchar(255)
,@ChartDescription varchar(255)
,@ChartShortDescription varchar(255)
,@ChartBaseLanguage varchar(255) = 'en'
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO [GL].[CHA01]
           (COANAME
           ,COASDES
           ,COADESC
           ,COALANG

           )
     VALUES
           (@ChartName
           ,@ChartShortDescription
           ,@ChartDescription
           ,@ChartBaseLanguage 

           )

COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [GL].[InsertJournal]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [GL].[InsertJournal]
 @JournalName nvarchar(255)
,@JournalDescription nvarchar(255)
,@ActualFlag char(1)
,@JournalCurrency int
,@JournalLedger int
,@JournalPeriod int
AS
DECLARE @JournalStatus varchar(50) = 'U'
DECLARE @JournalSource varchar(50) = 'M'
BEGIN TRY
BEGIN TRAN
INSERT INTO GL.JHE01
           (
		    JOURNNA
           ,JOURNDE
           ,JOURNSO
           ,JOURNST
		   ,JOURNAF
		   ,JOURNCU
		   ,JOURNLE
		   ,JOURNPE
          )
     VALUES
           (@JournalName 
           ,@JournalDescription
           ,@JournalSource
           ,@JournalStatus
		   ,@ActualFlag
		   ,@JournalCurrency
		   ,@JournalLedger
		   ,@JournalPeriod

           )

COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [GL].[InsertJournalDetails]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[InsertJournalDetails]
(
 @JournalID int
,@DebitCreditFlag char(1)
,@Amount money
,@Account int
)
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO GL.JLI01
           (
		    JRNLIJI
		   ,JRNLIDC
		   ,JRNLIAM
           ,JRNLACC
		   )
     VALUES
           (
		     @JournalID
		    ,@DebitCreditFlag 
            ,@Amount
			,@Account 
           )
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH
GO

/****** Object:  StoredProcedure [GL].[InsertPeriod]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[InsertPeriod]
 @PeriodName varchar(80)
,@PeriodStart date
,@PeriodEnd date
,@PeriodAdj varchar(1)
,@PeriodCalendar int


AS
INSERT INTO [GL].[PER01]
           (PERIODN
           ,PERIODS
           ,PERIODE
		   ,PERIODA
		   ,PERIODC
           )
     VALUES
           (@PeriodName 
           ,@PeriodStart 
           ,@PeriodEnd
           ,@PeriodAdj
		   ,@PeriodCalendar
           )


GO
/****** Object:  StoredProcedure [GL].[InsertRate]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[InsertRate]
	(
	 @CurrencyFrom int
	,@CurrenyTo int
	,@RateStartDate date
	,@RateEndDate date
	,@ExchageRate real
	)
AS

  INSERT INTO GL.RAT01
  (
   RATECUF
  ,RATECUT
  ,RATESDA
  ,RATEEDA
  ,RATEDVA)
  VALUES
  ( @CurrencyFrom
   ,@CurrenyTo
   ,@RateStartDate
   ,@RateEndDate
   ,@ExchageRate
   )
GO
/****** Object:  StoredProcedure [GL].[InsertTax]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [GL].[InsertTax]
 @TaxName nvarchar(80)
,@TaxRate real
,@TaxType nvarchar(20)
,@TaxStartDate date
,@TaxEndDate date
,@TaxTerritory nvarchar(50)
,@TaxAccount int
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO GL.TAX01
           (
		    TAXNAME
           ,TAXRATE
           ,TAXTYPE
		   ,TAXSTAR
		   ,TAXEEND
           ,TAXTERR
           ,TAXACCT)
     VALUES
           (
		    @TaxName
           ,@TaxRate
           ,@TaxType
		   ,@TaxStartDate
		   ,@TaxEndDate
           ,@TaxTerritory
           ,@TaxAccount
		   )

COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [GL].[UpdateAccount]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[UpdateAccount]
		@AccountID int
	   ,@AccountCode varchar(255)
       ,@AccountName varchar(255)
       ,@AccountType varchar(20)
       ,@AccountPosting varchar(1)
       ,@AccountBudgeting varchar(1)
       ,@AccountStatus varchar(1)
       ,@AccountLevel int
       ,@AccountParent varchar(255)
		AS
		DECLARE @UpdatedDate date = GETDATE()
		UPDATE GL.ACC01 SET  ACCNTNB = @AccountCode 
		                    ,ACCNTNM = @AccountName
						    ,ACCNTTP = @AccountType 
						    ,ACCNTPO = @AccountPosting 
		                    ,ACCNTBU = @AccountBudgeting
						    ,ACCNTST = @AccountStatus
						    ,ACCNTLE = @AccountLevel
                            ,ACCNTUD = @UpdatedDate
						   

		WHERE ACCNTCD = @AccountID
		

GO
/****** Object:  StoredProcedure [GL].[UpdateBudget]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[UpdateBudget]
 @BudgetID int
,@BudgetName nvarchar(80) 
,@BudgetDescription nvarchar(255) 
,@BudgetStatus nvarchar(20)
,@BudgetCalendar int
,@BudgetLedger int
AS
DECLARE @UpdatedDate date = GETDATE()
BEGIN TRY
BEGIN TRAN
UPDATE GL.BUD01 SET  BUDGETN = @BudgetName , BUDGETD = @BudgetDescription , BUDGETS =  @BudgetStatus, BUDGECA = @BudgetCalendar, BUDGETL = @BudgetLedger, BUDGEUD = @UpdatedDate
WHERE BUDGETI =  @BudgetID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [GL].[UpdateCalendar]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[UpdateCalendar]
    @CalendarID int
   ,@CalendarStatus varchar(80)
   
AS
DECLARE @UpdatedDate date = GETDATE()
BEGIN TRY
BEGIN TRAN
UPDATE CAL01 SET CALENDS = @CalendarStatus , CALENLU = @UpdatedDate
WHERE CALENID = @CalendarID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH



GO
/****** Object:  StoredProcedure [GL].[UpdateChart]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[UpdateChart]
 @ChartId integer
,@ChartName varchar(255)
,@ChartDescription varchar(255)
,@ChartShortDescription varchar(255)
,@ChartBaseLanguage varchar(255)
AS
DECLARE @UpdatedDate date = GETDATE()
BEGIN TRY
BEGIN TRAN
UPDATE  GL.CHA01 SET COANAME = @ChartName , COASDES = @ChartShortDescription, COADESC = @ChartDescription, COALANG = @ChartBaseLanguage , COAUPDD = @UpdatedDate
WHERE COASIDS = @ChartId
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH



GO
/****** Object:  StoredProcedure [GL].[UpdateCurrency]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[UpdateCurrency]
    @currencyId int = 5,
	@status varchar(1)
AS
BEGIN TRY
BEGIN TRAN
UPDATE  CUR01 SET CURRENG = @status WHERE CURRENI = @currencyId
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [GL].[UpdateJournal]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[UpdateJournal]
 @JournalID int
,@JournalName nvarchar(255) 
,@JournalDescription nvarchar(255) 
AS  
DECLARE @UpdatedDate date = GETDATE()
BEGIN TRY
BEGIN TRAN
UPDATE JHE01 SET JOURNNA = @JournalName  , JOURNDE = @JournalDescription , JOURNUD = @UpdatedDate 
WHERE JOURNID =  @JournalID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH



GO
/****** Object:  StoredProcedure [GL].[UpdateLedger]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[UpdateLedger]
 @LedgerID int
,@LedgerName varchar(80) 
,@LedgerDescription varchar(255) 
AS
DECLARE @UpdatedDate date = GETDATE()
BEGIN TRY
BEGIN TRAN
UPDATE GL.LED01 SET  LEDGERN = @LedgerName , LEDGERD = @LedgerDescription , LEDGERL =  @UpdatedDate
WHERE LEDGERI =  @LedgerID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [GL].[UpdatePeriod]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[UpdatePeriod]
 @PeriodID int
,@PeriodStatus varchar(1)
AS
DECLARE @UpdatedDate date = GETDATE()
UPDATE PER01 SET PERIODT = @PeriodStatus , PERIODM = @UpdatedDate 
WHERE PERIODI = @PeriodID


GO
/****** Object:  StoredProcedure [GL].[UpdateRate]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[UpdateRate]
	(
     @RateId int
	,@CurrencyFrom int
	,@CurrenyTo int
	,@RateStartDate date
	,@RateEndDate date
	,@ExchageRate real
	)
AS
  DECLARE @UpdatedDate date = GETDATE()
  UPDATE GL.RAT01 SET   RATECUF = @CurrencyFrom 
                       ,RATECUT = @CurrenyTo
                       ,RATESDA = @RateStartDate
                       ,RATEEDA = @RateEndDate
                       ,RATEDVA = @ExchageRate
					   ,RATEUPD = @UpdatedDate
   WHERE RATEIDS  = @RateId

GO
/****** Object:  StoredProcedure [GL].[UpdateSegment]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[UpdateSegment]
 @SegmentId int
,@SegmentName nvarchar(255)
,@SegmentDescription nvarchar(80)

AS
DECLARE @UpdatedDate date = GETDATE()
UPDATE GL.ACS01 SET  ACSNAME =  @SegmentName ,  ACSDESC = @SegmentDescription, ACSNTUD =  @UpdatedDate  WHERE ACSTSID = @SegmentId

GO
/****** Object:  StoredProcedure [GL].[UpdateTax]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [GL].[UpdateTax]
 @TaxID int
,@TaxName nvarchar(80)
,@TaxRate real 
,@TaxType nvarchar(20)
,@TaxStartDate date
,@TaxEndDate date
,@TaxTerritory nvarchar(50)
,@TaxAccount int
AS
DECLARE @UpdatedDate date = GETDATE()
BEGIN TRY
BEGIN TRAN
UPDATE GL.TAX01 SET  TAXNAME = @TaxName  , TAXRATE = @TaxRate , TAXTYPE = @TaxType , TAXSTAR = @TaxStartDate, TAXEEND = @TaxEndDate, TAXUATE = @UpdatedDate ,  TAXTERR = @TaxTerritory  ,  TAXACCT = @TaxAccount 
WHERE TAXCODE = @TaxID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH

GO
/****** Object:  StoredProcedure [PR].[DeleteProduct]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [PR].[DeleteProduct]
		@ProductID int
	    AS
		DELETE FROM PR.PRO01 WHERE PRODUCD=@ProductID


GO
/****** Object:  StoredProcedure [PR].[DeleteProductFamily]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [PR].[DeleteProductFamily]
 @ProductFamilyID int
AS
DELETE FROM PR.PFA01 WHERE PFATSID =  @ProductFamilyID



GO
/****** Object:  StoredProcedure [PR].[DeleteSubProductFamily]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [PR].[DeleteSubProductFamily]
 @ProductSubFamilyID int
AS
DELETE FROM PR.PSF01 WHERE PSFTSID =  @ProductSubFamilyID



GO
/****** Object:  StoredProcedure [PR].[InsertProduct]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [PR].[InsertProduct]
(
 @ProductSubFamily int
,@ProductCode nvarchar(80)
,@ProductName nvarchar(80)
,@ProductDescription nvarchar(80)
,@ProductListPrice money
)
AS
INSERT INTO PR.PRO01
           (
		    PRODTSF
		   ,PRODNUB
           ,PRODTNM
		   ,PRODTDE
           ,PRODTLP
		   )
     VALUES
           (
		     @ProductSubFamily
		    ,@ProductCode 
            ,@ProductName
			,@ProductDescription
			,@ProductListPrice
           )


GO
/****** Object:  StoredProcedure [PR].[InsertProductFamily]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [PR].[InsertProductFamily]
 @ProductFamilyName nvarchar(80)
,@ProductFamilyDescription nvarchar(80)
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO PR.PFA01
           (PFANAME
           ,PFADESC
            )
     VALUES
           (@ProductFamilyName
           ,@ProductFamilyDescription
           );
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [PR].[InsertProductSubFamily]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [PR].[InsertProductSubFamily]
 @ProductFamily int
,@ProductSubFamilyName nvarchar(80)
,@ProductSubFamilyDescription nvarchar(80)
AS
BEGIN TRY
BEGIN TRAN
INSERT INTO PR.PSF01
           (PSFPFFK
           ,PSFNAME
           ,PSFDESC
            )
     VALUES
           (@ProductFamily
           ,@ProductSubFamilyName
           ,@ProductSubFamilyDescription
           );
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [PR].[UpdateProduct]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [PR].[UpdateProduct]
		@ProductID int
	   ,@ProductCode nvarchar(80)
       ,@ProductName nvarchar(80)
       ,@ProductDescription nvarchar(80)
       ,@ProductListPrice money
       ,@ProductSubFamily int
		AS
		UPDATE PR.PRO01 SET  PRODNUB = @ProductCode
		                    ,PRODTNM = @ProductName
						    ,PRODTDE = @ProductDescription
						    ,PRODTLP = @ProductListPrice 
							,PRODTSF = @ProductSubFamily
		WHERE PRODUCD = @ProductID
		

GO
/****** Object:  StoredProcedure [PR].[UpdateProductFamily]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [PR].[UpdateProductFamily]
 @ProductFamilyID int
,@ProductFamilyName nvarchar(80) 
,@ProductFamilyDescription nvarchar(80) 
AS
BEGIN TRY
BEGIN TRAN
UPDATE PR.PFA01 SET  PFANAME = @ProductFamilyName , PFADESC= @ProductFamilyDescription
WHERE PFATSID =  @ProductFamilyID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  StoredProcedure [PR].[UpdateProductSubFamily]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [PR].[UpdateProductSubFamily]
 @ProductSubFamilyID int
,@ProductSubFamilyName nvarchar(80) 
,@ProductSubFamilyDescription nvarchar(80) 
,@ProductFamily int
AS
BEGIN TRY
BEGIN TRAN
UPDATE PR.PSF01 SET  PSFNAME = @ProductSubFamilyName , PSFDESC = @ProductSubFamilyDescription , PSFPFFK = @ProductFamily
WHERE PSFTSID =  @ProductSubFamilyID
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH


GO
/****** Object:  Table [AP].[BIL01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AP].[BIL01](
	[BILLSID] [int] NOT NULL,
	[BILDOCN]  AS ('BI'+CONVERT([nchar],[BILLSID],(0))),
	[BILDODA] [date] NULL,
	[BILDUDA] [date] NULL,
	[BILSTAT] [nvarchar](20) NULL,
	[BILORIG] [nvarchar](20) NULL,
	[BILORTY] [int] NULL,
	[BILNOTE] [nvarchar](255) NULL,
	[BILGROS] [money] NULL,
	[BILDISC] [money] NULL,
	[BILTAXE] [money] NULL,
	[BILNETA] [money] NULL,
	[BILRNUS] [int] NULL,
	[BILRNDA] [date] NULL,
	[BILRNUU] [int] NULL,
	[BILRNUD] [date] NULL,
	[BILLEGA] [int] NULL,
	[BILBPAR] [int] NULL,
	[BILPERI] [int] NULL,
	[BILDOTY] [int] NULL,
 CONSTRAINT [BIL01_BILLSID_PK] PRIMARY KEY CLUSTERED 
(
	[BILLSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AP].[BLI01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AP].[BLI01](
	[BLILIID] [int] NOT NULL,
	[BLILIBI] [int] NOT NULL,
	[BLILQUA] [int] NULL,
	[BLILPRI] [money] NULL,
	[BLILUSR] [int] NULL,
	[BLILDAT] [date] NULL,
	[BLILIUS] [int] NULL,
	[BLILIDA] [date] NULL,
	[BLILPRO] [int] NULL,
	[BLITAID] [int] NULL,
	[BLILLTO]  AS (isnull([BLILQUA]*[BLILPRI],(0.00))),
	[BLIDISC] [money] NULL,
	[BLITAXE] [money] NULL,
	[BLINETA] [money] NULL,
 CONSTRAINT [BLI01_BLILIID_BLILIBI_PK] PRIMARY KEY CLUSTERED 
(
	[BLILIID] ASC,
	[BLILIBI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AP].[GOR01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AP].[GOR01](
	[GORERID] [int] NOT NULL,
	[GORDOCN]  AS ('GR'+CONVERT([nchar],[GORERID],(0))),
	[GORDODA] [date] NULL,
	[GORSTAT] [nvarchar](20) NULL,
	[GORORIG] [nvarchar](20) NULL,
	[GORORTY] [int] NULL,
	[GORNOTE] [nvarchar](255) NULL,
	[GORGROS] [money] NULL,
	[GORDISC] [money] NULL,
	[GORTAXE] [money] NULL,
	[GORNETA] [money] NULL,
	[GORRNUS] [int] NULL,
	[GORRNDA] [date] NULL,
	[GORRNUU] [int] NULL,
	[GORRNUD] [date] NULL,
	[GORLEGA] [int] NULL,
	[GORBPAR] [int] NULL,
	[GORPERI] [int] NULL,
	[GORDOTY] [int] NULL,
 CONSTRAINT [GOR01_GORERID_PK] PRIMARY KEY CLUSTERED 
(
	[GORERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AP].[GRL01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AP].[GRL01](
	[GRLLIID] [int] NOT NULL,
	[GRLLIGR] [int] NOT NULL,
	[GRLLQUA] [int] NULL,
	[GRLLPRI] [money] NULL,
	[GRLLUSR] [int] NULL,
	[GRLLDAT] [date] NULL,
	[GRLLIUS] [int] NULL,
	[GRLLIDA] [date] NULL,
	[GRLLPRO] [int] NULL,
	[GRLTAID] [int] NULL,
	[GRLLWAR] [int] NULL,
	[GRLLLTO]  AS (isnull([GRLLQUA]*[GRLLPRI],(0.00))),
	[GRLDISC] [money] NULL,
	[GRLTAXE] [money] NULL,
	[GRLNETA] [money] NULL,
 CONSTRAINT [GRL01_GRLLIID_GRLLIGR_PK] PRIMARY KEY CLUSTERED 
(
	[GRLLIID] ASC,
	[GRLLIGR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AP].[POL01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AP].[POL01](
	[POLLIID] [int] NOT NULL,
	[POLLIPO] [int] NOT NULL,
	[POLLQUA] [int] NOT NULL,
	[POLLPRI] [money] NOT NULL,
	[POLLUSR] [int] NULL,
	[POLLDAT] [date] NULL,
	[POLLIUS] [int] NULL,
	[POLLIDA] [date] NULL,
	[POLLPRO] [int] NULL,
	[POLTAID] [int] NULL,
	[POLLLTO]  AS (isnull([POLLQUA]*[POLLPRI],(0.00))),
	[POLDISC] [money] NULL,
	[POLTAXE] [money] NULL,
	[POLNETA] [money] NULL,
 CONSTRAINT [POL01_POLLIID_POLLIPO_PK] PRIMARY KEY CLUSTERED 
(
	[POLLIID] ASC,
	[POLLIPO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AP].[POR01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AP].[POR01](
	[PORRNID] [int] IDENTITY(1,1) NOT NULL,
	[PORDOCN]  AS ('PO'+CONVERT([nchar],[PORRNID],(0))),
	[PORDODA] [date] NULL,
	[PORSTAT] [nvarchar](20) NULL,
	[PORNOTE] [nvarchar](255) NULL,
	[PORORIG] [nvarchar](20) NULL,
	[PORORTY] [int] NULL,
	[PORGROS] [money] NULL,
	[PORDISC] [money] NULL,
	[PORTAXE] [money] NULL,
	[PORNETA] [money] NULL,
	[PORRNUS] [int] NULL,
	[PORRNDA] [date] NULL,
	[PORRNUU] [int] NULL,
	[PORRNUD] [date] NULL,
	[PORLEGA] [int] NULL,
	[PORBPAR] [int] NULL,
	[PORPERI] [int] NULL,
	[PORDOTY] [int] NULL,
 CONSTRAINT [POR01_PORRNID_PK] PRIMARY KEY CLUSTERED 
(
	[PORRNID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AP].[RFL01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AP].[RFL01](
	[RFLLIID] [int] NOT NULL,
	[RFLRFQI] [int] NOT NULL,
	[RFLLQUA] [int] NULL,
	[RFLLPRI] [money] NULL,
	[RFLLUSR] [int] NULL,
	[RFLLDAT] [date] NULL,
	[RFLLIUS] [int] NULL,
	[RFLLIDA] [date] NULL,
	[RFLLPRO] [int] NULL,
	[RFLTAID] [int] NULL,
	[RFLLLTO]  AS (isnull([RFLLQUA]*[RFLLPRI],(0.00))),
	[RFLDISC] [money] NULL,
	[RFLTAXE] [money] NULL,
	[RFLNETA] [money] NULL,
 CONSTRAINT [RFL01_RFLLIID_RFLRFQI_PK] PRIMARY KEY CLUSTERED 
(
	[RFLLIID] ASC,
	[RFLRFQI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AP].[RFQ01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AP].[RFQ01](
	[RFQPKID] [int] IDENTITY(1,1) NOT NULL,
	[RFQDOCN]  AS ('RFQ'+CONVERT([nchar],[RFQPKID],(0))),
	[RFQDATE] [date] NULL,
	[RFQSTAT] [nvarchar](20) NULL,
	[RFQNOTE] [nvarchar](255) NULL,
	[RFQGROS] [money] NULL,
	[RFQDISC] [money] NULL,
	[RFQTAXE] [money] NULL,
	[RFQNETA] [money] NULL,
	[RFQRNUS] [int] NULL,
	[RFQRNDA] [date] NULL,
	[RFQRNUU] [int] NULL,
	[RFQRNUD] [date] NULL,
	[RFQLEGA] [int] NULL,
	[RFQBPAR] [int] NULL,
	[RFQPERI] [int] NULL,
	[RFQDOTY] [int] NULL,
 CONSTRAINT [RFQ01_RFQPKID_PK] PRIMARY KEY CLUSTERED 
(
	[RFQPKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AR].[INL01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AR].[INL01](
	[INLLIID] [int] NOT NULL,
	[INLINID] [int] NOT NULL,
	[INLLQUA] [int] NOT NULL,
	[INLLPRI] [money] NOT NULL,
	[INLLUSR] [int] NULL,
	[INLLDAT] [date] NULL,
	[INLLIUS] [int] NULL,
	[INLLIDA] [date] NULL,
	[INLLPRO] [int] NULL,
	[INLTAID] [int] NULL,
	[INLLLTO]  AS (isnull([INLLQUA]*[INLLPRI],(0.00))),
	[INLDISC] [money] NULL,
	[INLTAXE] [money] NULL,
	[INLNETA] [money] NULL,
 CONSTRAINT [INL01_INLLIID_INLINID_PK] PRIMARY KEY CLUSTERED 
(
	[INLLIID] ASC,
	[INLINID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AR].[INV01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AR].[INV01](
	[INVOIID] [int] NOT NULL,
	[INVDOCN]  AS ('IN'+CONVERT([nchar],[INVOIID],(0))),
	[INVDODA] [date] NULL,
	[INVDUDA] [date] NULL,
	[INVSTAT] [nvarchar](20) NULL,
	[INVNOTE] [nvarchar](255) NULL,
	[INVORIG] [nvarchar](20) NULL,
	[INVORTY] [int] NULL,
	[INVGROS] [money] NULL,
	[INVDISC] [money] NULL,
	[INVTAXE] [money] NULL,
	[INVNETA] [money] NULL,
	[INVRNUS] [int] NULL,
	[INVRNDA] [date] NULL,
	[INVRNUU] [int] NULL,
	[INVRNUD] [date] NULL,
	[INVLEGA] [int] NULL,
	[INVBPAR] [int] NULL,
	[INVPERI] [int] NULL,
	[INVDOTY] [int] NULL,
 CONSTRAINT [INV01_INVOIID_PK] PRIMARY KEY CLUSTERED 
(
	[INVOIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AR].[QLI01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AR].[QLI01](
	[QLILIID] [int] NOT NULL,
	[QLILIBI] [int] NOT NULL,
	[QLILQUA] [int] NULL,
	[QLILPRI] [money] NULL,
	[QLILUSR] [int] NULL,
	[QLILDAT] [date] NULL,
	[QLILIUS] [int] NULL,
	[QLILIDA] [date] NULL,
	[QLILPRO] [int] NULL,
	[QLITAID] [int] NULL,
	[QLILLTO]  AS (isnull([QLILQUA]*[QLILPRI],(0.00))),
	[QLIDISC] [money] NULL,
	[QLITAXE] [money] NULL,
	[QLINETA] [money] NULL,
 CONSTRAINT [QLI01_QLILIID_QLILIBI_PK] PRIMARY KEY CLUSTERED 
(
	[QLILIID] ASC,
	[QLILIBI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AR].[QUO01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AR].[QUO01](
	[QUOTEID] [int] NOT NULL,
	[QUODOCN]  AS ('QU'+CONVERT([nchar],[QUOTEID],(0))),
	[QUODODA] [date] NULL,
	[QUOSTAT] [nvarchar](20) NULL,
	[QUONOTE] [nvarchar](255) NULL,
	[QUOGROS] [nvarchar](20) NULL,
	[QUODISC] [int] NULL,
	[QUOTAXE] [money] NULL,
	[QUONETA] [money] NULL,
	[QUORNUS] [int] NULL,
	[QUORNDA] [date] NULL,
	[QUORNUU] [int] NULL,
	[QUORNUD] [date] NULL,
	[QUOLEGA] [int] NULL,
	[QUOBPAR] [int] NULL,
	[QUOPERI] [int] NULL,
	[QUODOTY] [int] NULL,
 CONSTRAINT [QUO01_QUOTEID_PK] PRIMARY KEY CLUSTERED 
(
	[QUOTEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AR].[SHI01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AR].[SHI01](
	[SHIPMID] [int] NOT NULL,
	[SHIDOCN]  AS ('SH'+CONVERT([nchar],[SHIPMID],(0))),
	[SHIDODA] [date] NULL,
	[SHISTAT] [nvarchar](20) NULL,
	[SHINOTE] [nvarchar](255) NULL,
	[SHIORIG] [nvarchar](20) NULL,
	[SHIORTY] [int] NULL,
	[SHIGROS] [money] NULL,
	[SHIDISC] [money] NULL,
	[SHITAXE] [money] NULL,
	[SHINETA] [money] NULL,
	[SHIRNUS] [int] NULL,
	[SHIRNDA] [date] NULL,
	[SHIRNUU] [int] NULL,
	[SHIRNUD] [date] NULL,
	[SHILEGA] [int] NULL,
	[SHIBPAR] [int] NULL,
	[SHIPERI] [int] NULL,
	[SHIDOTY] [int] NULL,
 CONSTRAINT [SHI01_SHIPMID_PK] PRIMARY KEY CLUSTERED 
(
	[SHIPMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AR].[SHL01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AR].[SHL01](
	[SHLLIID] [int] NOT NULL,
	[SHLINID] [int] NOT NULL,
	[SHLLQUA] [int] NOT NULL,
	[SHLLPRI] [money] NOT NULL,
	[SHLLUSR] [int] NULL,
	[SHLLDAT] [date] NULL,
	[SHLLIUS] [int] NULL,
	[SHLLIDA] [date] NULL,
	[SHLLPRO] [int] NULL,
	[SHLTAID] [int] NULL,
	[SHLLLTO]  AS (isnull([SHLLQUA]*[SHLLPRI],(0.00))),
	[SHLDISC] [money] NULL,
	[SHLTAXE] [money] NULL,
	[SHLNETA] [money] NULL,
 CONSTRAINT [SHL01_SHLLIID_SHLINID_PK] PRIMARY KEY CLUSTERED 
(
	[SHLLIID] ASC,
	[SHLINID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AR].[SOH01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AR].[SOH01](
	[SOHRNID] [int] IDENTITY(1,1) NOT NULL,
	[SOHSTAT] [nvarchar](20) NULL,
	[SOHRNUS] [int] NULL,
	[SOHRNDA] [date] NULL,
	[SOHRNUU] [int] NULL,
	[SOHRNUD] [date] NULL,
	[SOHORGA] [int] NULL,
	[SOHCUST] [int] NULL,
 CONSTRAINT [SOH01_SOHRNID_PK] PRIMARY KEY CLUSTERED 
(
	[SOHRNID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AR].[SOL01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AR].[SOL01](
	[SOLLIID] [int] NOT NULL,
	[SOLLISO] [int] NOT NULL,
	[SOLLQUA] [int] NOT NULL,
	[SOLLPRI] [money] NOT NULL,
	[SOLLUSR] [int] NULL,
	[SOLLDAT] [date] NULL,
	[SOLLIUS] [int] NULL,
	[SOLLIDA] [date] NULL,
	[SOLLPRO] [int] NULL,
	[SOLTAID] [int] NULL,
	[SOLLLTO]  AS (isnull([SOLLQUA]*[SOLLPRI],(0.00))),
	[SOLDISC] [money] NULL,
	[SOLTAXE] [money] NULL,
	[SOLNETA] [money] NULL,
 CONSTRAINT [SOL01_SOLLIID_SOLLISO_PK] PRIMARY KEY CLUSTERED 
(
	[SOLLIID] ASC,
	[SOLLISO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [AR].[SOR01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AR].[SOR01](
	[SORDRID] [int] NOT NULL,
	[SORDOCN]  AS ('SO'+CONVERT([nchar],[SORDRID],(0))),
	[SORDODA] [date] NULL,
	[SORSTAT] [nvarchar](20) NULL,
	[SORNOTE] [nvarchar](255) NULL,
	[SORORIG] [nvarchar](20) NULL,
	[SORORTY] [int] NULL,
	[SORGROS] [money] NULL,
	[SORDISC] [money] NULL,
	[SORTAXE] [money] NULL,
	[SORNETA] [money] NULL,
	[SORRNUS] [int] NULL,
	[SORRNDA] [date] NULL,
	[SORRNUU] [int] NULL,
	[SORRNUD] [date] NULL,
	[SORLEGA] [int] NULL,
	[SORBPAR] [int] NULL,
	[SORPERI] [int] NULL,
	[SORDOTY] [int] NULL,
 CONSTRAINT [SOR01_SORDRID_PK] PRIMARY KEY CLUSTERED 
(
	[SORDRID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [BP].[BPA01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [BP].[BPA01](
	[BUSIPID] [int] IDENTITY(1,1) NOT NULL,
	[BUSICOD] [nvarchar](20) NOT NULL,
	[BUSINAM] [nvarchar](80) NOT NULL,
	[BUSITYP] [nvarchar](20) NOT NULL,
	[BUSIOUS] [int] NULL,
	[BUSIDAT] [date] NULL,
	[BUSIUDB] [int] NULL,
	[BUSIUDO] [date] NULL,
	[BUSTLEG] [int] NULL,
 CONSTRAINT [BPA01_BUSIPID_PK] PRIMARY KEY CLUSTERED 
(
	[BUSIPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [BP].[BPD01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [BP].[BPD01](
	[BPDREID] [int] IDENTITY(1,1) NOT NULL,
	[BPDRCIT] [nvarchar](50) NOT NULL,
	[BPDRSTR] [nvarchar](50) NOT NULL,
	[BPDRSTA] [nvarchar](200) NOT NULL,
	[BPDRTYP] [nvarchar](50) NOT NULL,
	[BUSIOUS] [int] NULL,
	[BUSIDAT] [date] NULL,
	[BUSIUDB] [int] NULL,
	[BUSIUDO] [date] NULL,
	[BPDRCOU] [nvarchar](50) NULL,
	[BPDRBPI] [int] NULL,
 CONSTRAINT [BPD01_BPDREID_PK] PRIMARY KEY CLUSTERED 
(
	[BPDREID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [CO].[ADD01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CO].[ADD01](
	[ADDREID] [int] IDENTITY(1,1) NOT NULL,
	[ADDRCIT] [nvarchar](50) NULL,
	[ADDRSTR] [nvarchar](50) NULL,
	[ADDRSTA] [nvarchar](200) NULL,
	[ADDRTYP] [nvarchar](50) NULL,
	[ADDRUSR] [int] NULL,
	[ADDRDAT] [date] NULL,
	[ADDRUUS] [int] NULL,
	[ADDRUAT] [date] NULL,
	[ADDRCOU] [nvarchar](50) NULL,
 CONSTRAINT [ADD01_ADDREID_PK] PRIMARY KEY CLUSTERED 
(
	[ADDREID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [CO].[BAN01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CO].[BAN01](
	[BANKSID] [int] IDENTITY(1,1) NOT NULL,
	[BANKCOD] [nvarchar](50) NULL,
	[BANKNAM] [nvarchar](50) NULL,
	[BANKUSR] [int] NULL,
	[BANKDAT] [date] NULL,
	[BANKUUS] [int] NULL,
	[BANKUAT] [date] NULL,
	[BANKTER] [nvarchar](50) NULL,
 CONSTRAINT [BAN01_BANKSID_PK] PRIMARY KEY CLUSTERED 
(
	[BANKSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [CO].[DOC01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CO].[DOC01](
	[DOCTYID] [int] IDENTITY(1,1) NOT NULL,
	[DOCTCOD] [nvarchar](50) NULL,
	[DOCTDES] [nvarchar](50) NULL,
 CONSTRAINT [DOC01_DOCTYID_PK] PRIMARY KEY CLUSTERED 
(
	[DOCTYID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [CO].[LEG01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CO].[LEG01](
	[LEGALID] [int] IDENTITY(1,1) NOT NULL,
	[LEGALNA] [nvarchar](80) NULL,
	[LEGALEG] [nvarchar](255) NULL,
	[LEGALIS] [nvarchar](255) NULL,
	[LEGALSR] [int] NULL,
	[LEGALAT] [date] NULL,
	[LEGALPU] [int] NULL,
	[LEGALPD] [date] NULL,
	[LEGALCA] [int] NULL,
	[LEGALHE] [int] NULL,
 CONSTRAINT [LEG01_LEGALID_PK] PRIMARY KEY CLUSTERED 
(
	[LEGALID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [CO].[TER01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CO].[TER01](
	[TERRCOD] [nvarchar](50) NOT NULL,
	[TERRNAM] [nvarchar](50) NULL,
	[TERRLAN] [nvarchar](50) NULL,
	[TERRSLA] [nvarchar](50) NULL,
 CONSTRAINT [TER01_TERRCOD_PK] PRIMARY KEY CLUSTERED 
(
	[TERRCOD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [CO].[USR01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CO].[USR01](
	[USERSID] [int] NOT NULL,
	[USERFNA] [nvarchar](80) NULL,
	[USERLNA] [nvarchar](80) NULL,
	[USEREMA] [nvarchar](80) NULL,
	[USERPAS] [nvarchar](80) NULL,
	[USERROL] [nvarchar](80) NULL,
	[USERUSR] [int] NULL,
	[USERDAT] [date] NULL,
	[USERUUP] [int] NULL,
	[USERUPD] [date] NOT NULL,
 CONSTRAINT [USR01_USERSID_PK] PRIMARY KEY CLUSTERED 
(
	[USERSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ErrorLogID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorTime] [datetime] NOT NULL,
	[UserName] [sysname] NOT NULL,
	[ErrorNumber] [int] NOT NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorProcedure] [nvarchar](126) NULL,
	[ErrorLine] [int] NULL,
	[ErrorMessage] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_ErrorLog_ErrorLogID] PRIMARY KEY CLUSTERED 
(
	[ErrorLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [GL].[ACC01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [GL].[ACC01](
	[ACCNTCD] [int] IDENTITY(1,1) NOT NULL,
	[ACCNTNB] [nvarchar](255) NOT NULL,
	[ACCNTNM] [nvarchar](255) NOT NULL,
	[ACCNTDE] [nvarchar](255) NULL,
	[ACCNTTP] [nvarchar](50) NULL,
	[ACCNTPO] [char](1) NULL,
	[ACCNTBU] [char](1) NULL,
	[ACCNTST] [char](1) NULL,
	[ACCNTLE] [int] NULL,
	[ACCNTGR] [int] NULL,
	[ACCNTUS] [int] NULL,
	[ACCNTDT] [date] NULL,
	[ACCNTUP] [int] NULL,
	[ACCNTUD] [date] NULL,
	[ACCNTCA] [int] NOT NULL,
	[ACCNTPA] [nvarchar](255) NULL,
 CONSTRAINT [ACC01_ACCNTCD_PK] PRIMARY KEY CLUSTERED 
(
	[ACCNTCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [GL].[BAL01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GL].[BAL01](
	[BALANCI] [int] IDENTITY(1,1) NOT NULL,
	[BALANBD] [numeric](19, 2) NULL,
	[BALANBC] [numeric](19, 2) NULL,
	[BALANPD] [numeric](19, 2) NULL,
	[BALANPC] [numeric](19, 2) NULL,
	[BALANUP] [int] NULL,
	[BALANUD] [date] NULL,
	[BALANAC] [int] NULL,
	[BALANJL] [int] NULL,
	[BALANJI] [int] NULL,
	[BALANPE] [int] NULL,
	[BALANLE] [int] NULL,
	[BALANCU] [int] NULL,
 CONSTRAINT [BAL01_BALANCID_PK] PRIMARY KEY CLUSTERED 
(
	[BALANCI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [GL].[BUD01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GL].[BUD01](
	[BUDGETI] [int] IDENTITY(1,1) NOT NULL,
	[BUDGETN] [nvarchar](80) NULL,
	[BUDGETD] [nvarchar](255) NULL,
	[BUDGETS] [nvarchar](20) NULL,
	[BUDGETU] [int] NULL,
	[BUDGETA] [date] NULL,
	[BUDGEDU] [int] NULL,
	[BUDGEUD] [date] NULL,
	[BUDGECA] [int] NULL,
	[BUDGETL] [int] NULL,
 CONSTRAINT [BUD01_BUDGETI_PK] PRIMARY KEY CLUSTERED 
(
	[BUDGETI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [GL].[BUL01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GL].[BUL01](
	[BULLILI] [int] NOT NULL,
	[BULLIBU] [int] NOT NULL,
	[BULLIAM] [decimal](19, 2) NOT NULL,
	[BULLUSR] [int] NULL,
	[BULLDAT] [date] NULL,
	[BULLIUS] [int] NULL,
	[BULLIDA] [date] NULL,
	[BULLACC] [int] NULL,
	[BULLPER] [int] NULL,
 CONSTRAINT [BUL01_BULLILI_BULLIBI_PK] PRIMARY KEY CLUSTERED 
(
	[BULLILI] ASC,
	[BULLIBU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [GL].[CAL01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [GL].[CAL01](
	[CALENID] [int] IDENTITY(10,10) NOT NULL,
	[CALENDN] [nvarchar](80) NULL,
	[CALENDS] [char](1) NULL,
	[CALENDU] [int] NULL,
	[CALENDT] [date] NULL,
	[CALENDP] [int] NULL,
	[CALENLU] [date] NULL,
 CONSTRAINT [CAL01_CALENDID_PK] PRIMARY KEY CLUSTERED 
(
	[CALENID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [GL].[CHA01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [GL].[CHA01](
	[COASIDS] [int] IDENTITY(10,10) NOT NULL,
	[COANAME] [nvarchar](80) NULL,
	[COASDES] [nvarchar](80) NULL,
	[COADESC] [nvarchar](255) NULL,
	[COALANG] [char](4) NULL,
	[COAUSER] [int] NULL,
	[COADATE] [date] NULL,
	[COAUPUS] [int] NULL,
	[COAUPDD] [date] NULL,
 CONSTRAINT [CHA01_COASIDS_PK] PRIMARY KEY CLUSTERED 
(
	[COASIDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [GL].[CUR01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [GL].[CUR01](
	[CURRENI] [int] IDENTITY(10,10) NOT NULL,
	[CURRENC] [nvarchar](80) NULL,
	[CURRENN] [nvarchar](80) NULL,
	[CURRENS] [nvarchar](80) NULL,
	[CURRENG] [char](1) NULL,
	[CURREND] [date] NULL,
	[CURRENE] [date] NULL,
	[CURRENU] [int] NULL,
	[CURRENA] [date] NULL,
	[CURRENL] [int] NULL,
	[CURRENB] [date] NULL,
	[CURRENF] [nvarchar](50) NULL,
 CONSTRAINT [CUR01_CURRENID_PK] PRIMARY KEY CLUSTERED 
(
	[CURRENI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [GL].[JHE01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [GL].[JHE01](
	[JOURNID] [int] IDENTITY(1,1) NOT NULL,
	[JOURNNA] [nvarchar](255) NULL,
	[JOURNDE] [nvarchar](255) NULL,
	[JOURNSO] [nvarchar](50) NULL,
	[JOURNST] [nvarchar](50) NULL,
	[JOURNAF] [char](1) NULL,
	[JOURNBF] [char](1) NULL,
	[JOURNTC] [money] NULL,
	[JOURNTD] [money] NULL,
	[JOURNUS] [int] NULL,
	[JOURNDA] [date] NULL,
	[JOURNUU] [int] NULL,
	[JOURNUD] [date] NULL,
	[JOURNCA] [int] NULL,
	[JOURNCU] [int] NULL,
	[JOURNLE] [int] NULL,
	[JOURNPE] [int] NULL,
 CONSTRAINT [JHE01_JOURNAID_PK] PRIMARY KEY CLUSTERED 
(
	[JOURNID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [GL].[JLI01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [GL].[JLI01](
	[JRNLILI] [int] NOT NULL,
	[JRNLIJI] [int] NOT NULL,
	[JRNLIDC] [char](1) NOT NULL,
	[JRNLIAM] [money] NOT NULL,
	[JRNLUSR] [int] NULL,
	[JRNLDAT] [date] NULL,
	[JRNLIUS] [int] NULL,
	[JRNLIDA] [date] NULL,
	[JRNLACC] [int] NULL,
 CONSTRAINT [JLI01_JRNLILIN_JRNLIJID_PK] PRIMARY KEY CLUSTERED 
(
	[JRNLILI] ASC,
	[JRNLIJI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [GL].[PER01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [GL].[PER01](
	[PERIODI] [int] IDENTITY(1,1) NOT NULL,
	[PERIODN] [nvarchar](80) NULL,
	[PERIODS] [date] NULL,
	[PERIODE] [date] NULL,
	[PERIODA] [nvarchar](50) NULL,
	[PERIODT] [char](1) NULL,
	[PERIODU] [int] NULL,
	[PERIODD] [date] NULL,
	[PERIODL] [int] NULL,
	[PERIODM] [date] NULL,
	[PERIODC] [int] NULL,
 CONSTRAINT [PER01_PERIODID_PK] PRIMARY KEY CLUSTERED 
(
	[PERIODI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [GL].[RAT01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GL].[RAT01](
	[RATEIDS] [int] IDENTITY(1,1) NOT NULL,
	[RATEDVA] [real] NULL,
	[RATESDA] [date] NULL,
	[RATEEDA] [date] NULL,
	[RATEUSR] [int] NULL,
	[RATEDAT] [date] NULL,
	[RATEUPU] [int] NULL,
	[RATEUPD] [date] NULL,
	[RATECUF] [int] NULL,
	[RATECUT] [int] NULL,
 CONSTRAINT [RAT01_RATEIDS_PK] PRIMARY KEY CLUSTERED 
(
	[RATEIDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [GL].[TAX01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GL].[TAX01](
	[TAXCODE] [int] IDENTITY(1,1) NOT NULL,
	[TAXNAME] [nvarchar](80) NULL,
	[TAXRATE] [real] NULL,
	[TAXTYPE] [nvarchar](50) NULL,
	[TAXSTAR] [date] NULL,
	[TAXEEND] [date] NULL,
	[TAXUSER] [int] NULL,
	[TAXDATE] [date] NULL,
	[TAXUUPD] [int] NULL,
	[TAXUATE] [date] NULL,
	[TAXACCT] [int] NULL,
	[TAXTERR] [nvarchar](50) NULL,
 CONSTRAINT [TAX01_TAXCODE_PK] PRIMARY KEY CLUSTERED 
(
	[TAXCODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [GL].[USR01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GL].[USR01](
	[USERSID] [int] NOT NULL,
	[USERFNA] [nvarchar](80) NULL,
	[USERLNA] [nvarchar](80) NULL,
	[USEREMA] [nvarchar](80) NULL,
	[USERPAS] [nvarchar](80) NULL,
	[USERROL] [nvarchar](80) NULL,
	[USERUSR] [int] NULL,
	[USERDAT] [date] NULL,
	[USERUUP] [int] NULL,
	[USERUPD] [date] NOT NULL,
 CONSTRAINT [USR01_USERSID_PK] PRIMARY KEY CLUSTERED 
(
	[USERSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PR].[PFA01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PR].[PFA01](
	[PFATSID] [int] IDENTITY(1,1) NOT NULL,
	[PFANAME] [nvarchar](80) NOT NULL,
	[PFADESC] [nvarchar](80) NULL,
	[PFANTUS] [int] NULL,
	[PFADATE] [date] NULL,
	[PFALUDB] [int] NULL,
	[PFALUDO] [date] NULL,
 CONSTRAINT [PFA01_PFATSID_PK] PRIMARY KEY CLUSTERED 
(
	[PFATSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PR].[PRO01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PR].[PRO01](
	[PRODUCD] [int] IDENTITY(1,1) NOT NULL,
	[PRODNUB] [nvarchar](80) NOT NULL,
	[PRODTNM] [nvarchar](80) NOT NULL,
	[PRODTDE] [nvarchar](80) NULL,
	[PRODTLP] [money] NULL,
	[PRODSIZ] [nvarchar](5) NULL,
	[PRODSUM] [nvarchar](3) NULL,
	[PRODWEI] [int] NULL,
	[PRODWUM] [nvarchar](3) NULL,
	[PRODCLA] [nvarchar](3) NULL,
	[PRODTST] [nvarchar](1) NULL,
	[PRODSSD] [date] NULL,
	[PRODSED] [date] NULL,
	[PRODDAT] [date] NULL,
	[PRODTUS] [int] NULL,
	[PRODTDT] [date] NULL,
	[PRODTUP] [int] NULL,
	[PRODTUD] [date] NULL,
	[PRODTSF] [int] NULL,
 CONSTRAINT [PRO01_PRODUCD_PK] PRIMARY KEY CLUSTERED 
(
	[PRODUCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PR].[PSF01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PR].[PSF01](
	[PSFTSID] [int] IDENTITY(1,1) NOT NULL,
	[PSFNAME] [nvarchar](80) NOT NULL,
	[PSFDESC] [nvarchar](80) NULL,
	[PSFCBUS] [int] NULL,
	[PSFDATE] [date] NULL,
	[PSFLUDB] [int] NULL,
	[PSFLUDO] [date] NULL,
	[PSFPFFK] [int] NULL,
 CONSTRAINT [PSF01_PSFTSID_PK] PRIMARY KEY CLUSTERED 
(
	[PSFTSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PR].[WAR01]    Script Date: 03/12/2017 10:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PR].[WAR01](
	[WAREHID] [int] IDENTITY(1,1) NOT NULL,
	[WAREDES] [nvarchar](80) NOT NULL,
	[WAREHUS] [int] NULL,
	[WARDATE] [date] NULL,
	[WARLUDB] [int] NULL,
	[WARLUDO] [date] NULL,
 CONSTRAINT [WAR01_WAREHID_PK] PRIMARY KEY CLUSTERED 
(
	[WAREHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
/****** Object:  Index [IX_ACC01]    Script Date: 03/12/2017 10:55:25 ******/
CREATE NONCLUSTERED INDEX [IX_ACC01] ON [GL].[ACC01]
(
	[ACCNTCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [CO].[ADD01] ADD  CONSTRAINT [DF_ADD01_ADDRDAT]  DEFAULT (getdate()) FOR [ADDRDAT]
GO
ALTER TABLE [CO].[ADD01] ADD  CONSTRAINT [DF_ADD01_ADDRUAT]  DEFAULT (getdate()) FOR [ADDRUAT]
GO
ALTER TABLE [CO].[BAN01] ADD  CONSTRAINT [DF_BAN01_BANKDAT]  DEFAULT (getdate()) FOR [BANKDAT]
GO
ALTER TABLE [CO].[BAN01] ADD  CONSTRAINT [DF_BAN01_BANKUAT]  DEFAULT (getdate()) FOR [BANKUAT]
GO
ALTER TABLE [CO].[LEG01] ADD  CONSTRAINT [DF_LEG01_LEGALAT]  DEFAULT (getdate()) FOR [LEGALAT]
GO
ALTER TABLE [CO].[LEG01] ADD  CONSTRAINT [DF_LEG01_LEGALPD]  DEFAULT (getdate()) FOR [LEGALPD]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [DF_ErrorLog_ErrorTime]  DEFAULT (getdate()) FOR [ErrorTime]
GO
ALTER TABLE [GL].[ACC01] ADD  CONSTRAINT [DF_ACC01_ACCNTDT]  DEFAULT (getdate()) FOR [ACCNTDT]
GO
ALTER TABLE [GL].[ACC01] ADD  CONSTRAINT [DF_ACC01_ACCNTUD]  DEFAULT (getdate()) FOR [ACCNTUD]
GO
ALTER TABLE [GL].[ACS01] ADD  CONSTRAINT [DF_ACS01_ACSDATE]  DEFAULT (getdate()) FOR [ACSDATE]
GO
ALTER TABLE [GL].[ACS01] ADD  CONSTRAINT [DF_ACS01_ACSNTUD]  DEFAULT (getdate()) FOR [ACSNTUD]
GO
ALTER TABLE [GL].[BUD01] ADD  CONSTRAINT [DF_BUD01_BUDGETA]  DEFAULT (getdate()) FOR [BUDGETA]
GO
ALTER TABLE [GL].[BUD01] ADD  CONSTRAINT [DF_BUD01_BUDGEUD]  DEFAULT (getdate()) FOR [BUDGEUD]
GO
ALTER TABLE [GL].[CAL01] ADD  CONSTRAINT [DF_CAL01_CALENDT]  DEFAULT (getdate()) FOR [CALENDT]
GO
ALTER TABLE [GL].[CAL01] ADD  CONSTRAINT [DF_CAL01_CALENLU]  DEFAULT (getdate()) FOR [CALENLU]
GO
ALTER TABLE [GL].[CHA01] ADD  CONSTRAINT [DF_CHA01_COADATE]  DEFAULT (getdate()) FOR [COADATE]
GO
ALTER TABLE [GL].[CHA01] ADD  CONSTRAINT [DF_CHA01_COAUPDD]  DEFAULT (getdate()) FOR [COAUPDD]
GO
ALTER TABLE [GL].[CUR01] ADD  CONSTRAINT [DF_CUR01_CURRENA]  DEFAULT (getdate()) FOR [CURRENA]
GO
ALTER TABLE [GL].[CUR01] ADD  CONSTRAINT [DF_CUR01_CURRENB]  DEFAULT (getdate()) FOR [CURRENB]
GO
ALTER TABLE [GL].[JHE01] ADD  CONSTRAINT [DF_JHE01_JOURNDA]  DEFAULT (getdate()) FOR [JOURNDA]
GO
ALTER TABLE [GL].[JHE01] ADD  CONSTRAINT [DF_JHE01_JOURNUD]  DEFAULT (getdate()) FOR [JOURNUD]
GO
ALTER TABLE [GL].[JLI01] ADD  CONSTRAINT [DF_JLI01_JRNLDAT]  DEFAULT (getdate()) FOR [JRNLDAT]
GO
ALTER TABLE [GL].[JLI01] ADD  CONSTRAINT [DF_JLI01_JRNLIDA]  DEFAULT (getdate()) FOR [JRNLIDA]
GO
ALTER TABLE [GL].[LED01] ADD  CONSTRAINT [DF_LED01_LEDGERA]  DEFAULT (getdate()) FOR [LEDGERA]
GO
ALTER TABLE [GL].[LED01] ADD  CONSTRAINT [DF_LED01_LEDGERL]  DEFAULT (getdate()) FOR [LEDGERL]
GO
ALTER TABLE [GL].[ORG01] ADD  CONSTRAINT [DF_ORG01_ORGANAT]  DEFAULT (getdate()) FOR [ORGANAT]
GO
ALTER TABLE [GL].[ORG01] ADD  CONSTRAINT [DF_ORG01_ORGANPD]  DEFAULT (getdate()) FOR [ORGANPD]
GO
ALTER TABLE [GL].[PER01] ADD  CONSTRAINT [DF_PER01_PERIODT]  DEFAULT ('C') FOR [PERIODT]
GO
ALTER TABLE [GL].[PER01] ADD  CONSTRAINT [DF_PER01_PERIODD]  DEFAULT (getdate()) FOR [PERIODD]
GO
ALTER TABLE [GL].[PER01] ADD  CONSTRAINT [DF_PER01_PERIODM]  DEFAULT (getdate()) FOR [PERIODM]
GO
ALTER TABLE [GL].[RAT01] ADD  CONSTRAINT [DF_RAT01_RATEDAT]  DEFAULT (getdate()) FOR [RATEDAT]
GO
ALTER TABLE [GL].[RAT01] ADD  CONSTRAINT [DF_RAT01_RATEUPD]  DEFAULT (getdate()) FOR [RATEUPD]
GO
ALTER TABLE [AP].[BIL01]  WITH CHECK ADD  CONSTRAINT [FK_BIL01_BPA01] FOREIGN KEY([BILBPAR])
REFERENCES [BP].[BPA01] ([BUSIPID])
GO
ALTER TABLE [AP].[BIL01] CHECK CONSTRAINT [FK_BIL01_BPA01]
GO
ALTER TABLE [AP].[BIL01]  WITH CHECK ADD  CONSTRAINT [FK_BIL01_DOC01] FOREIGN KEY([BILDOTY])
REFERENCES [CO].[DOC01] ([DOCTYID])
GO
ALTER TABLE [AP].[BIL01] CHECK CONSTRAINT [FK_BIL01_DOC01]
GO
ALTER TABLE [AP].[BIL01]  WITH CHECK ADD  CONSTRAINT [FK_BIL01_LEG01] FOREIGN KEY([BILLEGA])
REFERENCES [CO].[LEG01] ([LEGALID])
GO
ALTER TABLE [AP].[BIL01] CHECK CONSTRAINT [FK_BIL01_LEG01]
GO
ALTER TABLE [AP].[BIL01]  WITH CHECK ADD  CONSTRAINT [FK_BIL01_PER01] FOREIGN KEY([BILPERI])
REFERENCES [GL].[PER01] ([PERIODI])
GO
ALTER TABLE [AP].[BIL01] CHECK CONSTRAINT [FK_BIL01_PER01]
GO
ALTER TABLE [AP].[BLI01]  WITH CHECK ADD  CONSTRAINT [FK_BLI01_BIL01] FOREIGN KEY([BLILIBI])
REFERENCES [AP].[BIL01] ([BILLSID])
GO
ALTER TABLE [AP].[BLI01] CHECK CONSTRAINT [FK_BLI01_BIL01]
GO
ALTER TABLE [AP].[BLI01]  WITH CHECK ADD  CONSTRAINT [FK_BLI01_PRO01] FOREIGN KEY([BLILPRO])
REFERENCES [PR].[PRO01] ([PRODUCD])
GO
ALTER TABLE [AP].[BLI01] CHECK CONSTRAINT [FK_BLI01_PRO01]
GO
ALTER TABLE [AP].[BLI01]  WITH CHECK ADD  CONSTRAINT [FK_BLI01_TAX01] FOREIGN KEY([BLITAID])
REFERENCES [GL].[TAX01] ([TAXCODE])
GO
ALTER TABLE [AP].[BLI01] CHECK CONSTRAINT [FK_BLI01_TAX01]
GO
ALTER TABLE [AP].[GOR01]  WITH CHECK ADD  CONSTRAINT [FK_GOR01_BPA01] FOREIGN KEY([GORBPAR])
REFERENCES [BP].[BPA01] ([BUSIPID])
GO
ALTER TABLE [AP].[GOR01] CHECK CONSTRAINT [FK_GOR01_BPA01]
GO
ALTER TABLE [AP].[GOR01]  WITH CHECK ADD  CONSTRAINT [FK_GOR01_DOC01] FOREIGN KEY([GORDOTY])
REFERENCES [CO].[DOC01] ([DOCTYID])
GO
ALTER TABLE [AP].[GOR01] CHECK CONSTRAINT [FK_GOR01_DOC01]
GO
ALTER TABLE [AP].[GOR01]  WITH CHECK ADD  CONSTRAINT [FK_GOR01_LEG01] FOREIGN KEY([GORLEGA])
REFERENCES [CO].[LEG01] ([LEGALID])
GO
ALTER TABLE [AP].[GOR01] CHECK CONSTRAINT [FK_GOR01_LEG01]
GO
ALTER TABLE [AP].[GOR01]  WITH CHECK ADD  CONSTRAINT [FK_GOR01_PER01] FOREIGN KEY([GORPERI])
REFERENCES [GL].[PER01] ([PERIODI])
GO
ALTER TABLE [AP].[GOR01] CHECK CONSTRAINT [FK_GOR01_PER01]
GO
ALTER TABLE [AP].[GRL01]  WITH CHECK ADD  CONSTRAINT [FK_GRL01_WAR01] FOREIGN KEY([GRLLWAR])
REFERENCES [PR].[WAR01] ([WAREHID])
GO
ALTER TABLE [AP].[GRL01] CHECK CONSTRAINT [FK_GRL01_WAR01]
GO
ALTER TABLE [AP].[GRL01]  WITH CHECK ADD  CONSTRAINT [GRL01_GOR01_FK] FOREIGN KEY([GRLLIGR])
REFERENCES [AP].[GOR01] ([GORERID])
GO
ALTER TABLE [AP].[GRL01] CHECK CONSTRAINT [GRL01_GOR01_FK]
GO
ALTER TABLE [AP].[GRL01]  WITH CHECK ADD  CONSTRAINT [GRL01_PRO01_FK] FOREIGN KEY([GRLLPRO])
REFERENCES [PR].[PRO01] ([PRODUCD])
GO
ALTER TABLE [AP].[GRL01] CHECK CONSTRAINT [GRL01_PRO01_FK]
GO
ALTER TABLE [AP].[POL01]  WITH CHECK ADD  CONSTRAINT [POL01_POR01_FK] FOREIGN KEY([POLLIPO])
REFERENCES [AP].[POR01] ([PORRNID])
GO
ALTER TABLE [AP].[POL01] CHECK CONSTRAINT [POL01_POR01_FK]
GO
ALTER TABLE [AP].[POL01]  WITH CHECK ADD  CONSTRAINT [POL01_PRO01_FK] FOREIGN KEY([POLLPRO])
REFERENCES [PR].[PRO01] ([PRODUCD])
GO
ALTER TABLE [AP].[POL01] CHECK CONSTRAINT [POL01_PRO01_FK]
GO
ALTER TABLE [AP].[POR01]  WITH CHECK ADD  CONSTRAINT [FK_POR01_BPA01] FOREIGN KEY([PORBPAR])
REFERENCES [BP].[BPA01] ([BUSIPID])
GO
ALTER TABLE [AP].[POR01] CHECK CONSTRAINT [FK_POR01_BPA01]
GO
ALTER TABLE [AP].[POR01]  WITH CHECK ADD  CONSTRAINT [FK_POR01_DOC01] FOREIGN KEY([PORDOTY])
REFERENCES [CO].[DOC01] ([DOCTYID])
GO
ALTER TABLE [AP].[POR01] CHECK CONSTRAINT [FK_POR01_DOC01]
GO
ALTER TABLE [AP].[POR01]  WITH CHECK ADD  CONSTRAINT [FK_POR01_LEG01] FOREIGN KEY([PORLEGA])
REFERENCES [CO].[LEG01] ([LEGALID])
GO
ALTER TABLE [AP].[POR01] CHECK CONSTRAINT [FK_POR01_LEG01]
GO
ALTER TABLE [AP].[POR01]  WITH CHECK ADD  CONSTRAINT [FK_POR01_PER01] FOREIGN KEY([PORPERI])
REFERENCES [GL].[PER01] ([PERIODI])
GO
ALTER TABLE [AP].[POR01] CHECK CONSTRAINT [FK_POR01_PER01]
GO
ALTER TABLE [AP].[RFL01]  WITH CHECK ADD  CONSTRAINT [RFL01_PRO01_FK] FOREIGN KEY([RFLLPRO])
REFERENCES [PR].[PRO01] ([PRODUCD])
GO
ALTER TABLE [AP].[RFL01] CHECK CONSTRAINT [RFL01_PRO01_FK]
GO
ALTER TABLE [AP].[RFL01]  WITH CHECK ADD  CONSTRAINT [RFL01_RFQ01_FK] FOREIGN KEY([RFLRFQI])
REFERENCES [AP].[RFQ01] ([RFQPKID])
GO
ALTER TABLE [AP].[RFL01] CHECK CONSTRAINT [RFL01_RFQ01_FK]
GO
ALTER TABLE [AP].[RFQ01]  WITH CHECK ADD  CONSTRAINT [FK_RFQ01_BPA01] FOREIGN KEY([RFQBPAR])
REFERENCES [BP].[BPA01] ([BUSIPID])
GO
ALTER TABLE [AP].[RFQ01] CHECK CONSTRAINT [FK_RFQ01_BPA01]
GO
ALTER TABLE [AP].[RFQ01]  WITH CHECK ADD  CONSTRAINT [FK_RFQ01_DOC01] FOREIGN KEY([RFQDOTY])
REFERENCES [CO].[DOC01] ([DOCTYID])
GO
ALTER TABLE [AP].[RFQ01] CHECK CONSTRAINT [FK_RFQ01_DOC01]
GO
ALTER TABLE [AP].[RFQ01]  WITH CHECK ADD  CONSTRAINT [FK_RFQ01_LEG01] FOREIGN KEY([RFQLEGA])
REFERENCES [CO].[LEG01] ([LEGALID])
GO
ALTER TABLE [AP].[RFQ01] CHECK CONSTRAINT [FK_RFQ01_LEG01]
GO
ALTER TABLE [AP].[RFQ01]  WITH CHECK ADD  CONSTRAINT [FK_RFQ01_PER01] FOREIGN KEY([RFQPERI])
REFERENCES [GL].[PER01] ([PERIODI])
GO
ALTER TABLE [AP].[RFQ01] CHECK CONSTRAINT [FK_RFQ01_PER01]
GO
ALTER TABLE [AP].[VEN01]  WITH CHECK ADD  CONSTRAINT [VEN01_ACC01_FK] FOREIGN KEY([VENACCO])
REFERENCES [GL].[ACC01] ([ACCNTCD])
GO
ALTER TABLE [AP].[VEN01] CHECK CONSTRAINT [VEN01_ACC01_FK]
GO
ALTER TABLE [AP].[VEN01]  WITH CHECK ADD  CONSTRAINT [VEN01_ORG01_FK] FOREIGN KEY([VENORGA])
REFERENCES [GL].[ORG01] ([ORGANID])
GO
ALTER TABLE [AP].[VEN01] CHECK CONSTRAINT [VEN01_ORG01_FK]
GO
ALTER TABLE [AR].[CUS01]  WITH NOCHECK ADD  CONSTRAINT [CUS01_ACC01_FK] FOREIGN KEY([CUSTACC])
REFERENCES [GL].[ACC01] ([ACCNTCD])
NOT FOR REPLICATION 
GO
ALTER TABLE [AR].[CUS01] NOCHECK CONSTRAINT [CUS01_ACC01_FK]
GO
ALTER TABLE [AR].[CUS01]  WITH CHECK ADD  CONSTRAINT [CUS01_ORG01_FK] FOREIGN KEY([CUSTORG])
REFERENCES [GL].[ORG01] ([ORGANID])
GO
ALTER TABLE [AR].[CUS01] CHECK CONSTRAINT [CUS01_ORG01_FK]
GO
ALTER TABLE [AR].[INL01]  WITH CHECK ADD  CONSTRAINT [FK_INL01_INV01] FOREIGN KEY([INLINID])
REFERENCES [AR].[INV01] ([INVOIID])
GO
ALTER TABLE [AR].[INL01] CHECK CONSTRAINT [FK_INL01_INV01]
GO
ALTER TABLE [AR].[INL01]  WITH CHECK ADD  CONSTRAINT [FK_INL01_PRO01] FOREIGN KEY([INLLPRO])
REFERENCES [PR].[PRO01] ([PRODUCD])
GO
ALTER TABLE [AR].[INL01] CHECK CONSTRAINT [FK_INL01_PRO01]
GO
ALTER TABLE [AR].[INL01]  WITH CHECK ADD  CONSTRAINT [FK_INL01_TAX01] FOREIGN KEY([INLTAID])
REFERENCES [GL].[TAX01] ([TAXCODE])
GO
ALTER TABLE [AR].[INL01] CHECK CONSTRAINT [FK_INL01_TAX01]
GO
ALTER TABLE [AR].[INV01]  WITH CHECK ADD  CONSTRAINT [FK_INV01_BPA01] FOREIGN KEY([INVBPAR])
REFERENCES [BP].[BPA01] ([BUSIPID])
GO
ALTER TABLE [AR].[INV01] CHECK CONSTRAINT [FK_INV01_BPA01]
GO
ALTER TABLE [AR].[INV01]  WITH CHECK ADD  CONSTRAINT [FK_INV01_DOC01] FOREIGN KEY([INVDOTY])
REFERENCES [CO].[DOC01] ([DOCTYID])
GO
ALTER TABLE [AR].[INV01] CHECK CONSTRAINT [FK_INV01_DOC01]
GO
ALTER TABLE [AR].[INV01]  WITH CHECK ADD  CONSTRAINT [FK_INV01_LEG01] FOREIGN KEY([INVLEGA])
REFERENCES [CO].[LEG01] ([LEGALID])
GO
ALTER TABLE [AR].[INV01] CHECK CONSTRAINT [FK_INV01_LEG01]
GO
ALTER TABLE [AR].[INV01]  WITH CHECK ADD  CONSTRAINT [FK_INV01_PER01] FOREIGN KEY([INVPERI])
REFERENCES [GL].[PER01] ([PERIODI])
GO
ALTER TABLE [AR].[INV01] CHECK CONSTRAINT [FK_INV01_PER01]
GO
ALTER TABLE [AR].[QLI01]  WITH CHECK ADD  CONSTRAINT [FK_QLI01_PRO01] FOREIGN KEY([QLILPRO])
REFERENCES [PR].[PRO01] ([PRODUCD])
GO
ALTER TABLE [AR].[QLI01] CHECK CONSTRAINT [FK_QLI01_PRO01]
GO
ALTER TABLE [AR].[QLI01]  WITH CHECK ADD  CONSTRAINT [FK_QLI01_QUO01] FOREIGN KEY([QLILIBI])
REFERENCES [AR].[QUO01] ([QUOTEID])
GO
ALTER TABLE [AR].[QLI01] CHECK CONSTRAINT [FK_QLI01_QUO01]
GO
ALTER TABLE [AR].[QLI01]  WITH CHECK ADD  CONSTRAINT [FK_QLI01_TAX01] FOREIGN KEY([QLITAID])
REFERENCES [GL].[TAX01] ([TAXCODE])
GO
ALTER TABLE [AR].[QLI01] CHECK CONSTRAINT [FK_QLI01_TAX01]
GO
ALTER TABLE [AR].[QUO01]  WITH CHECK ADD  CONSTRAINT [FK_QUO01_BPA01] FOREIGN KEY([QUOBPAR])
REFERENCES [BP].[BPA01] ([BUSIPID])
GO
ALTER TABLE [AR].[QUO01] CHECK CONSTRAINT [FK_QUO01_BPA01]
GO
ALTER TABLE [AR].[QUO01]  WITH CHECK ADD  CONSTRAINT [FK_QUO01_DOC01] FOREIGN KEY([QUODOTY])
REFERENCES [CO].[DOC01] ([DOCTYID])
GO
ALTER TABLE [AR].[QUO01] CHECK CONSTRAINT [FK_QUO01_DOC01]
GO
ALTER TABLE [AR].[QUO01]  WITH CHECK ADD  CONSTRAINT [FK_QUO01_LEG01] FOREIGN KEY([QUOLEGA])
REFERENCES [CO].[LEG01] ([LEGALID])
GO
ALTER TABLE [AR].[QUO01] CHECK CONSTRAINT [FK_QUO01_LEG01]
GO
ALTER TABLE [AR].[QUO01]  WITH CHECK ADD  CONSTRAINT [FK_QUO01_PER01] FOREIGN KEY([QUOPERI])
REFERENCES [GL].[PER01] ([PERIODI])
GO
ALTER TABLE [AR].[QUO01] CHECK CONSTRAINT [FK_QUO01_PER01]
GO
ALTER TABLE [AR].[SHI01]  WITH CHECK ADD  CONSTRAINT [FK_SHI01_BPA01] FOREIGN KEY([SHIBPAR])
REFERENCES [BP].[BPA01] ([BUSIPID])
GO
ALTER TABLE [AR].[SHI01] CHECK CONSTRAINT [FK_SHI01_BPA01]
GO
ALTER TABLE [AR].[SHI01]  WITH CHECK ADD  CONSTRAINT [FK_SHI01_DOC01] FOREIGN KEY([SHIDOTY])
REFERENCES [CO].[DOC01] ([DOCTYID])
GO
ALTER TABLE [AR].[SHI01] CHECK CONSTRAINT [FK_SHI01_DOC01]
GO
ALTER TABLE [AR].[SHI01]  WITH CHECK ADD  CONSTRAINT [FK_SHI01_LEG01] FOREIGN KEY([SHILEGA])
REFERENCES [CO].[LEG01] ([LEGALID])
GO
ALTER TABLE [AR].[SHI01] CHECK CONSTRAINT [FK_SHI01_LEG01]
GO
ALTER TABLE [AR].[SHI01]  WITH CHECK ADD  CONSTRAINT [FK_SHI01_PER01] FOREIGN KEY([SHIPERI])
REFERENCES [GL].[PER01] ([PERIODI])
GO
ALTER TABLE [AR].[SHI01] CHECK CONSTRAINT [FK_SHI01_PER01]
GO
ALTER TABLE [AR].[SHL01]  WITH CHECK ADD  CONSTRAINT [FK_SHL01_PRO01] FOREIGN KEY([SHLLPRO])
REFERENCES [PR].[PRO01] ([PRODUCD])
GO
ALTER TABLE [AR].[SHL01] CHECK CONSTRAINT [FK_SHL01_PRO01]
GO
ALTER TABLE [AR].[SHL01]  WITH CHECK ADD  CONSTRAINT [FK_SHL01_SHI01] FOREIGN KEY([SHLINID])
REFERENCES [AR].[SHI01] ([SHIPMID])
GO
ALTER TABLE [AR].[SHL01] CHECK CONSTRAINT [FK_SHL01_SHI01]
GO
ALTER TABLE [AR].[SHL01]  WITH CHECK ADD  CONSTRAINT [FK_SHL01_TAX01] FOREIGN KEY([SHLTAID])
REFERENCES [GL].[TAX01] ([TAXCODE])
GO
ALTER TABLE [AR].[SHL01] CHECK CONSTRAINT [FK_SHL01_TAX01]
GO
ALTER TABLE [AR].[SOH01]  WITH CHECK ADD  CONSTRAINT [SOH01_CUS01_FK] FOREIGN KEY([SOHCUST])
REFERENCES [AR].[CUS01] ([CUSTSID])
GO
ALTER TABLE [AR].[SOH01] CHECK CONSTRAINT [SOH01_CUS01_FK]
GO
ALTER TABLE [AR].[SOH01]  WITH CHECK ADD  CONSTRAINT [SOH01_ORG01_FK] FOREIGN KEY([SOHORGA])
REFERENCES [GL].[ORG01] ([ORGANID])
GO
ALTER TABLE [AR].[SOH01] CHECK CONSTRAINT [SOH01_ORG01_FK]
GO
ALTER TABLE [AR].[SOL01]  WITH CHECK ADD  CONSTRAINT [SOL01_PRO01_FK] FOREIGN KEY([SOLLPRO])
REFERENCES [PR].[PRO01] ([PRODUCD])
GO
ALTER TABLE [AR].[SOL01] CHECK CONSTRAINT [SOL01_PRO01_FK]
GO
ALTER TABLE [AR].[SOL01]  WITH CHECK ADD  CONSTRAINT [SOL01_SOR01_FK] FOREIGN KEY([SOLLISO])
REFERENCES [AR].[SOR01] ([SORDRID])
GO
ALTER TABLE [AR].[SOL01] CHECK CONSTRAINT [SOL01_SOR01_FK]
GO
ALTER TABLE [AR].[SOR01]  WITH CHECK ADD  CONSTRAINT [FK_SOR01_BPA01] FOREIGN KEY([SORBPAR])
REFERENCES [BP].[BPA01] ([BUSIPID])
GO
ALTER TABLE [AR].[SOR01] CHECK CONSTRAINT [FK_SOR01_BPA01]
GO
ALTER TABLE [AR].[SOR01]  WITH CHECK ADD  CONSTRAINT [FK_SOR01_DOC01] FOREIGN KEY([SORDOTY])
REFERENCES [CO].[DOC01] ([DOCTYID])
GO
ALTER TABLE [AR].[SOR01] CHECK CONSTRAINT [FK_SOR01_DOC01]
GO
ALTER TABLE [AR].[SOR01]  WITH CHECK ADD  CONSTRAINT [FK_SOR01_LEG01] FOREIGN KEY([SORLEGA])
REFERENCES [CO].[LEG01] ([LEGALID])
GO
ALTER TABLE [AR].[SOR01] CHECK CONSTRAINT [FK_SOR01_LEG01]
GO
ALTER TABLE [AR].[SOR01]  WITH CHECK ADD  CONSTRAINT [FK_SOR01_PER01] FOREIGN KEY([SORPERI])
REFERENCES [GL].[PER01] ([PERIODI])
GO
ALTER TABLE [AR].[SOR01] CHECK CONSTRAINT [FK_SOR01_PER01]
GO
ALTER TABLE [BP].[BPA01]  WITH CHECK ADD  CONSTRAINT [FK_BPA01_LEG01] FOREIGN KEY([BUSTLEG])
REFERENCES [CO].[LEG01] ([LEGALID])
GO
ALTER TABLE [BP].[BPA01] CHECK CONSTRAINT [FK_BPA01_LEG01]
GO
ALTER TABLE [BP].[BPD01]  WITH CHECK ADD  CONSTRAINT [FK_BPD01_BPA01] FOREIGN KEY([BPDRBPI])
REFERENCES [BP].[BPA01] ([BUSIPID])
GO
ALTER TABLE [BP].[BPD01] CHECK CONSTRAINT [FK_BPD01_BPA01]
GO
ALTER TABLE [BP].[BPD01]  WITH CHECK ADD  CONSTRAINT [FK_BPD01_TER01] FOREIGN KEY([BPDRCOU])
REFERENCES [CO].[TER01] ([TERRCOD])
GO
ALTER TABLE [BP].[BPD01] CHECK CONSTRAINT [FK_BPD01_TER01]
GO
ALTER TABLE [CO].[ADD01]  WITH CHECK ADD  CONSTRAINT [ADD01_TER01_FK] FOREIGN KEY([ADDRCOU])
REFERENCES [CO].[TER01] ([TERRCOD])
GO
ALTER TABLE [CO].[ADD01] CHECK CONSTRAINT [ADD01_TER01_FK]
GO
ALTER TABLE [CO].[ADD01]  WITH CHECK ADD  CONSTRAINT [ADD01_USR01_CREATEDBY_FK] FOREIGN KEY([ADDRUSR])
REFERENCES [CO].[USR01] ([USERSID])
GO
ALTER TABLE [CO].[ADD01] CHECK CONSTRAINT [ADD01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [CO].[ADD01]  WITH CHECK ADD  CONSTRAINT [ADD01_USR01_UPDATEDBY_FK] FOREIGN KEY([ADDRUUS])
REFERENCES [CO].[USR01] ([USERSID])
GO
ALTER TABLE [CO].[ADD01] CHECK CONSTRAINT [ADD01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [CO].[BAN01]  WITH CHECK ADD  CONSTRAINT [BAN01_TER01_FK] FOREIGN KEY([BANKTER])
REFERENCES [CO].[TER01] ([TERRCOD])
GO
ALTER TABLE [CO].[BAN01] CHECK CONSTRAINT [BAN01_TER01_FK]
GO
ALTER TABLE [CO].[BAN01]  WITH CHECK ADD  CONSTRAINT [BAN01_USR01_CREATEDBY_FK] FOREIGN KEY([BANKUSR])
REFERENCES [CO].[USR01] ([USERSID])
GO
ALTER TABLE [CO].[BAN01] CHECK CONSTRAINT [BAN01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [CO].[BAN01]  WITH CHECK ADD  CONSTRAINT [BAN01_USR01_UPDATEDBY_FK] FOREIGN KEY([BANKUUS])
REFERENCES [CO].[USR01] ([USERSID])
GO
ALTER TABLE [CO].[BAN01] CHECK CONSTRAINT [BAN01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [CO].[LEG01]  WITH CHECK ADD  CONSTRAINT [FK_LEG01_ADD01] FOREIGN KEY([LEGALHE])
REFERENCES [CO].[ADD01] ([ADDREID])
GO
ALTER TABLE [CO].[LEG01] CHECK CONSTRAINT [FK_LEG01_ADD01]
GO
ALTER TABLE [CO].[LEG01]  WITH CHECK ADD  CONSTRAINT [FK_LEG01_CHA01] FOREIGN KEY([LEGALCA])
REFERENCES [GL].[CHA01] ([COASIDS])
GO
ALTER TABLE [CO].[LEG01] CHECK CONSTRAINT [FK_LEG01_CHA01]
GO
ALTER TABLE [CO].[LEG01]  WITH CHECK ADD  CONSTRAINT [LEG01_USR01_CREATEDBY_FK] FOREIGN KEY([LEGALSR])
REFERENCES [CO].[USR01] ([USERSID])
GO
ALTER TABLE [CO].[LEG01] CHECK CONSTRAINT [LEG01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [CO].[LEG01]  WITH CHECK ADD  CONSTRAINT [LEG01_USR01_UPDATEDBY_FK] FOREIGN KEY([LEGALPU])
REFERENCES [CO].[USR01] ([USERSID])
GO
ALTER TABLE [CO].[LEG01] CHECK CONSTRAINT [LEG01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [CO].[USR01]  WITH CHECK ADD  CONSTRAINT [USR01_CREATEDBY_FK] FOREIGN KEY([USERUSR])
REFERENCES [CO].[USR01] ([USERSID])
GO
ALTER TABLE [CO].[USR01] CHECK CONSTRAINT [USR01_CREATEDBY_FK]
GO
ALTER TABLE [CO].[USR01]  WITH CHECK ADD  CONSTRAINT [USR01_UPDATEDBY_FK] FOREIGN KEY([USERUUP])
REFERENCES [CO].[USR01] ([USERSID])
GO
ALTER TABLE [CO].[USR01] CHECK CONSTRAINT [USR01_UPDATEDBY_FK]
GO
ALTER TABLE [GL].[ACC01]  WITH NOCHECK ADD  CONSTRAINT [ACC01_CHA01_FK] FOREIGN KEY([ACCNTCA])
REFERENCES [GL].[CHA01] ([COASIDS])
GO
ALTER TABLE [GL].[ACC01] NOCHECK CONSTRAINT [ACC01_CHA01_FK]
GO
ALTER TABLE [GL].[ACC01]  WITH NOCHECK ADD  CONSTRAINT [ACC01_USR01_CREATEDBY_FK] FOREIGN KEY([ACCNTUS])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[ACC01] NOCHECK CONSTRAINT [ACC01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [GL].[ACC01]  WITH NOCHECK ADD  CONSTRAINT [ACC01_USR01_UPDATEDBY_FK] FOREIGN KEY([ACCNTUP])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[ACC01] NOCHECK CONSTRAINT [ACC01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [GL].[ACS01]  WITH CHECK ADD  CONSTRAINT [ACS01_CHA01_FK] FOREIGN KEY([ACSCOID])
REFERENCES [GL].[CHA01] ([COASIDS])
GO
ALTER TABLE [GL].[ACS01] CHECK CONSTRAINT [ACS01_CHA01_FK]
GO
ALTER TABLE [GL].[ACS01]  WITH CHECK ADD  CONSTRAINT [ACS01_USR01_CREATEDBY_FK] FOREIGN KEY([ACSNTUS])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[ACS01] CHECK CONSTRAINT [ACS01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [GL].[ACS01]  WITH CHECK ADD  CONSTRAINT [ACS01_USR01_UPDATEDBY_FK] FOREIGN KEY([ACSNTUP])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[ACS01] CHECK CONSTRAINT [ACS01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [GL].[AGP01]  WITH CHECK ADD  CONSTRAINT [AGP01_CHA01_FK] FOREIGN KEY([ACGRCOA])
REFERENCES [GL].[CHA01] ([COASIDS])
GO
ALTER TABLE [GL].[AGP01] CHECK CONSTRAINT [AGP01_CHA01_FK]
GO
ALTER TABLE [GL].[AGP01]  WITH CHECK ADD  CONSTRAINT [AGP01_USR01_CREATEDBY_FK] FOREIGN KEY([ACGNTUS])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[AGP01] CHECK CONSTRAINT [AGP01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [GL].[AGP01]  WITH CHECK ADD  CONSTRAINT [AGP01_USR01_UPDATEDBY_FK] FOREIGN KEY([ACGNTUP])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[AGP01] CHECK CONSTRAINT [AGP01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [GL].[BAL01]  WITH NOCHECK ADD  CONSTRAINT [BAL01_ACC01_FK] FOREIGN KEY([BALANAC])
REFERENCES [GL].[ACC01] ([ACCNTCD])
NOT FOR REPLICATION 
GO
ALTER TABLE [GL].[BAL01] NOCHECK CONSTRAINT [BAL01_ACC01_FK]
GO
ALTER TABLE [GL].[BAL01]  WITH CHECK ADD  CONSTRAINT [BAL01_CUR01_FK] FOREIGN KEY([BALANCU])
REFERENCES [GL].[CUR01] ([CURRENI])
GO
ALTER TABLE [GL].[BAL01] CHECK CONSTRAINT [BAL01_CUR01_FK]
GO
ALTER TABLE [GL].[BAL01]  WITH CHECK ADD  CONSTRAINT [BAL01_LED01_FK] FOREIGN KEY([BALANLE])
REFERENCES [GL].[LED01] ([LEDGERI])
GO
ALTER TABLE [GL].[BAL01] CHECK CONSTRAINT [BAL01_LED01_FK]
GO
ALTER TABLE [GL].[BAL01]  WITH CHECK ADD  CONSTRAINT [BAL01_PER01_FK] FOREIGN KEY([BALANPE])
REFERENCES [GL].[PER01] ([PERIODI])
GO
ALTER TABLE [GL].[BAL01] CHECK CONSTRAINT [BAL01_PER01_FK]
GO
ALTER TABLE [GL].[BAL01]  WITH CHECK ADD  CONSTRAINT [BAL01_USR01_UPDATEDBY_FK] FOREIGN KEY([BALANUP])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[BAL01] CHECK CONSTRAINT [BAL01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [GL].[BUD01]  WITH CHECK ADD  CONSTRAINT [BUD01_CAL01_FK] FOREIGN KEY([BUDGECA])
REFERENCES [GL].[CAL01] ([CALENID])
GO
ALTER TABLE [GL].[BUD01] CHECK CONSTRAINT [BUD01_CAL01_FK]
GO
ALTER TABLE [GL].[BUD01]  WITH CHECK ADD  CONSTRAINT [BUD01_LED01_FK] FOREIGN KEY([BUDGETL])
REFERENCES [GL].[LED01] ([LEDGERI])
GO
ALTER TABLE [GL].[BUD01] CHECK CONSTRAINT [BUD01_LED01_FK]
GO
ALTER TABLE [GL].[BUD01]  WITH CHECK ADD  CONSTRAINT [BUD01_USR01_CREATEDBY_FK] FOREIGN KEY([BUDGETU])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[BUD01] CHECK CONSTRAINT [BUD01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [GL].[BUD01]  WITH CHECK ADD  CONSTRAINT [BUD01_USR01_UPDATEDBY_FK] FOREIGN KEY([BUDGEDU])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[BUD01] CHECK CONSTRAINT [BUD01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [GL].[BUL01]  WITH NOCHECK ADD  CONSTRAINT [BUL01_ACC01_FK] FOREIGN KEY([BULLACC])
REFERENCES [GL].[ACC01] ([ACCNTCD])
NOT FOR REPLICATION 
GO
ALTER TABLE [GL].[BUL01] NOCHECK CONSTRAINT [BUL01_ACC01_FK]
GO
ALTER TABLE [GL].[BUL01]  WITH CHECK ADD  CONSTRAINT [BUL01_BUD01_FK] FOREIGN KEY([BULLIBU])
REFERENCES [GL].[BUD01] ([BUDGETI])
GO
ALTER TABLE [GL].[BUL01] CHECK CONSTRAINT [BUL01_BUD01_FK]
GO
ALTER TABLE [GL].[BUL01]  WITH CHECK ADD  CONSTRAINT [BUL01_PER01_FK] FOREIGN KEY([BULLPER])
REFERENCES [GL].[PER01] ([PERIODI])
GO
ALTER TABLE [GL].[BUL01] CHECK CONSTRAINT [BUL01_PER01_FK]
GO
ALTER TABLE [GL].[CAL01]  WITH CHECK ADD  CONSTRAINT [CAL01_USR01_CREATEDBY_FK] FOREIGN KEY([CALENDU])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[CAL01] CHECK CONSTRAINT [CAL01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [GL].[CAL01]  WITH CHECK ADD  CONSTRAINT [CAL01_USR01_UPDATEDBY_FK] FOREIGN KEY([CALENDP])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[CAL01] CHECK CONSTRAINT [CAL01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [GL].[CHA01]  WITH CHECK ADD  CONSTRAINT [CHA01_USR01_CREATEDBY_FK] FOREIGN KEY([COAUSER])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[CHA01] CHECK CONSTRAINT [CHA01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [GL].[CHA01]  WITH CHECK ADD  CONSTRAINT [CHA01_USR01_UPDATEDBY_FK] FOREIGN KEY([COAUSER])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[CHA01] CHECK CONSTRAINT [CHA01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [GL].[JHE01]  WITH CHECK ADD  CONSTRAINT [FK_JHE01_LEG01] FOREIGN KEY([JOURNLE])
REFERENCES [CO].[LEG01] ([LEGALID])
GO
ALTER TABLE [GL].[JHE01] CHECK CONSTRAINT [FK_JHE01_LEG01]
GO
ALTER TABLE [GL].[JHE01]  WITH CHECK ADD  CONSTRAINT [JHE01_CUR01_FK] FOREIGN KEY([JOURNCU])
REFERENCES [GL].[CUR01] ([CURRENI])
GO
ALTER TABLE [GL].[JHE01] CHECK CONSTRAINT [JHE01_CUR01_FK]
GO
ALTER TABLE [GL].[JHE01]  WITH CHECK ADD  CONSTRAINT [JHE01_PER01_FK] FOREIGN KEY([JOURNPE])
REFERENCES [GL].[PER01] ([PERIODI])
GO
ALTER TABLE [GL].[JHE01] CHECK CONSTRAINT [JHE01_PER01_FK]
GO
ALTER TABLE [GL].[JHE01]  WITH CHECK ADD  CONSTRAINT [JHE01_USR01_CREATEDBY_FK] FOREIGN KEY([JOURNUS])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[JHE01] CHECK CONSTRAINT [JHE01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [GL].[JHE01]  WITH CHECK ADD  CONSTRAINT [JHE01_USR01_UPDATEDBY_FK] FOREIGN KEY([JOURNUU])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[JHE01] CHECK CONSTRAINT [JHE01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [GL].[JLI01]  WITH NOCHECK ADD  CONSTRAINT [JLI01_ACC01_FK] FOREIGN KEY([JRNLACC])
REFERENCES [GL].[ACC01] ([ACCNTCD])
NOT FOR REPLICATION 
GO
ALTER TABLE [GL].[JLI01] NOCHECK CONSTRAINT [JLI01_ACC01_FK]
GO
ALTER TABLE [GL].[JLI01]  WITH CHECK ADD  CONSTRAINT [JLI01_JHE01_FK] FOREIGN KEY([JRNLIJI])
REFERENCES [GL].[JHE01] ([JOURNID])
GO
ALTER TABLE [GL].[JLI01] CHECK CONSTRAINT [JLI01_JHE01_FK]
GO
ALTER TABLE [GL].[JLI01]  WITH CHECK ADD  CONSTRAINT [JLI01_USR01_CREATEDBY_FK] FOREIGN KEY([JRNLUSR])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[JLI01] CHECK CONSTRAINT [JLI01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [GL].[JLI01]  WITH CHECK ADD  CONSTRAINT [JLI01_USR01_UPDATEDBY_FK] FOREIGN KEY([JRNLIUS])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[JLI01] CHECK CONSTRAINT [JLI01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [GL].[LED01]  WITH CHECK ADD  CONSTRAINT [LED01_CAL01_FK] FOREIGN KEY([LEDGERT])
REFERENCES [GL].[CAL01] ([CALENID])
GO
ALTER TABLE [GL].[LED01] CHECK CONSTRAINT [LED01_CAL01_FK]
GO
ALTER TABLE [GL].[LED01]  WITH CHECK ADD  CONSTRAINT [LED01_CHA01_FK] FOREIGN KEY([LEDGERC])
REFERENCES [GL].[CHA01] ([COASIDS])
GO
ALTER TABLE [GL].[LED01] CHECK CONSTRAINT [LED01_CHA01_FK]
GO
ALTER TABLE [GL].[LED01]  WITH CHECK ADD  CONSTRAINT [LED01_CUR01_FK] FOREIGN KEY([LEDGERR])
REFERENCES [GL].[CUR01] ([CURRENI])
GO
ALTER TABLE [GL].[LED01] CHECK CONSTRAINT [LED01_CUR01_FK]
GO
ALTER TABLE [GL].[LED01]  WITH CHECK ADD  CONSTRAINT [LED01_USR01_CREATEDBY_FK] FOREIGN KEY([LEDGERU])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[LED01] CHECK CONSTRAINT [LED01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [GL].[LED01]  WITH CHECK ADD  CONSTRAINT [LED01_USR01_UPDATEDBY_FK] FOREIGN KEY([LEDGERS])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[LED01] CHECK CONSTRAINT [LED01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [GL].[ORG01]  WITH CHECK ADD  CONSTRAINT [ORG01_LED01_FK] FOREIGN KEY([ORGANLE])
REFERENCES [GL].[LED01] ([LEDGERI])
GO
ALTER TABLE [GL].[ORG01] CHECK CONSTRAINT [ORG01_LED01_FK]
GO
ALTER TABLE [GL].[ORG01]  WITH CHECK ADD  CONSTRAINT [ORG01_USR01_CREATEDBY_FK] FOREIGN KEY([ORGANSR])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[ORG01] CHECK CONSTRAINT [ORG01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [GL].[ORG01]  WITH CHECK ADD  CONSTRAINT [ORG01_USR01_UPDATEDBY_FK] FOREIGN KEY([ORGANPU])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[ORG01] CHECK CONSTRAINT [ORG01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [GL].[PER01]  WITH CHECK ADD  CONSTRAINT [PER01_CAL01_FK] FOREIGN KEY([PERIODC])
REFERENCES [GL].[CAL01] ([CALENID])
GO
ALTER TABLE [GL].[PER01] CHECK CONSTRAINT [PER01_CAL01_FK]
GO
ALTER TABLE [GL].[PER01]  WITH CHECK ADD  CONSTRAINT [PER01_USR01_CREATEDBY_FK] FOREIGN KEY([PERIODU])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[PER01] CHECK CONSTRAINT [PER01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [GL].[PER01]  WITH CHECK ADD  CONSTRAINT [PER01_USR01_UPDATEDBY_FK] FOREIGN KEY([PERIODL])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[PER01] CHECK CONSTRAINT [PER01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [GL].[RAT01]  WITH CHECK ADD  CONSTRAINT [RAT01_CUR01_FROM_FK] FOREIGN KEY([RATECUF])
REFERENCES [GL].[CUR01] ([CURRENI])
GO
ALTER TABLE [GL].[RAT01] CHECK CONSTRAINT [RAT01_CUR01_FROM_FK]
GO
ALTER TABLE [GL].[RAT01]  WITH CHECK ADD  CONSTRAINT [RAT01_CUR01_TO_FK] FOREIGN KEY([RATECUT])
REFERENCES [GL].[CUR01] ([CURRENI])
GO
ALTER TABLE [GL].[RAT01] CHECK CONSTRAINT [RAT01_CUR01_TO_FK]
GO
ALTER TABLE [GL].[RAT01]  WITH CHECK ADD  CONSTRAINT [RAT01_USR01_CREATEDBY_FK] FOREIGN KEY([RATEUSR])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[RAT01] CHECK CONSTRAINT [RAT01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [GL].[RAT01]  WITH CHECK ADD  CONSTRAINT [RAT01_USR01_UPDATEDBY_FK] FOREIGN KEY([RATEUPU])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[RAT01] CHECK CONSTRAINT [RAT01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [GL].[TAX01]  WITH CHECK ADD  CONSTRAINT [TAX01_USR01_CREATEDBY_FK] FOREIGN KEY([TAXUSER])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[TAX01] CHECK CONSTRAINT [TAX01_USR01_CREATEDBY_FK]
GO
ALTER TABLE [GL].[TAX01]  WITH CHECK ADD  CONSTRAINT [TAX01_USR01_UPDATEDBY_FK] FOREIGN KEY([TAXUUPD])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[TAX01] CHECK CONSTRAINT [TAX01_USR01_UPDATEDBY_FK]
GO
ALTER TABLE [GL].[USR01]  WITH CHECK ADD  CONSTRAINT [USR01_CREATEDBY_FK] FOREIGN KEY([USERUSR])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[USR01] CHECK CONSTRAINT [USR01_CREATEDBY_FK]
GO
ALTER TABLE [GL].[USR01]  WITH CHECK ADD  CONSTRAINT [USR01_UPDATEDBY_FK] FOREIGN KEY([USERUUP])
REFERENCES [GL].[USR01] ([USERSID])
GO
ALTER TABLE [GL].[USR01] CHECK CONSTRAINT [USR01_UPDATEDBY_FK]
GO
ALTER TABLE [PR].[PRO01]  WITH CHECK ADD  CONSTRAINT [PRO01_PSF01_FK] FOREIGN KEY([PRODTSF])
REFERENCES [PR].[PSF01] ([PSFTSID])
GO
ALTER TABLE [PR].[PRO01] CHECK CONSTRAINT [PRO01_PSF01_FK]
GO
ALTER TABLE [PR].[PSF01]  WITH CHECK ADD  CONSTRAINT [PSF01_PFA01_FK] FOREIGN KEY([PSFTSID])
REFERENCES [PR].[PFA01] ([PFATSID])
GO
ALTER TABLE [PR].[PSF01] CHECK CONSTRAINT [PSF01_PFA01_FK]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the BIL01 table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILLSID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bill docment id' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILDOCN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bill docment date' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILDODA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bill due date' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILDUDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bill document status' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILSTAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bill document origin' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILORIG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bill document origin type' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILORTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bill document note' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILNOTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total gross amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILGROS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total discount amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILDISC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total tax amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILTAXE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total net to pay amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILNETA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILRNUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILRNDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILRNUU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILRNUD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the legal entities table (CO.LEG01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILLEGA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the business partners table (CO.BPA01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILBPAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the periods table (CO.PER01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILPERI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the documents type table (CO.DOC01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01', @level2type=N'COLUMN',@level2name=N'BILDOTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bills document header table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BIL01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Part of the composite primary key of the BLI1 table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BLI01', @level2type=N'COLUMN',@level2name=N'BLILIID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key that reference the bills headers (BIL01) table, also primary key' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BLI01', @level2type=N'COLUMN',@level2name=N'BLILIBI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product quantity' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BLI01', @level2type=N'COLUMN',@level2name=N'BLILQUA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product price' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BLI01', @level2type=N'COLUMN',@level2name=N'BLILPRI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BLI01', @level2type=N'COLUMN',@level2name=N'BLILUSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BLI01', @level2type=N'COLUMN',@level2name=N'BLILDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BLI01', @level2type=N'COLUMN',@level2name=N'BLILIUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BLI01', @level2type=N'COLUMN',@level2name=N'BLILIDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the products table (PR.PRO01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BLI01', @level2type=N'COLUMN',@level2name=N'BLILPRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the products table (GL.TAX01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BLI01', @level2type=N'COLUMN',@level2name=N'BLITAID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line gross amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BLI01', @level2type=N'COLUMN',@level2name=N'BLILLTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line discount amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BLI01', @level2type=N'COLUMN',@level2name=N'BLIDISC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line tax amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BLI01', @level2type=N'COLUMN',@level2name=N'BLITAXE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line net to pay amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BLI01', @level2type=N'COLUMN',@level2name=N'BLINETA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bills details table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'BLI01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the GOR01 table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORERID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Goods receipt docment id' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORDOCN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Goods receipt docment date' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORDODA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Goods receipt status' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORSTAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Goods receipt document origin' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORORIG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Goods receipt document origin type' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORORTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Goods receipt note' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORNOTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total gross amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORGROS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total discount amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORDISC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total tax amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORTAXE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total net to pay amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORNETA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORRNUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORRNDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORRNUU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORRNUD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the legal entities table (CO.LEG01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORLEGA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the business partners table (BP.BPA01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORBPAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the periods table (GL.PER01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORPERI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the documents type table (CO.DOC01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01', @level2type=N'COLUMN',@level2name=N'GORDOTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Goods receipt order document header table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GOR01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Part of the composite primary key of the GRL01 table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GRL01', @level2type=N'COLUMN',@level2name=N'GRLLIID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key that reference the goods receipt headers (GOR01) table, also primary key' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GRL01', @level2type=N'COLUMN',@level2name=N'GRLLIGR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Desired quantity' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GRL01', @level2type=N'COLUMN',@level2name=N'GRLLQUA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product price' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GRL01', @level2type=N'COLUMN',@level2name=N'GRLLPRI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GRL01', @level2type=N'COLUMN',@level2name=N'GRLLUSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GRL01', @level2type=N'COLUMN',@level2name=N'GRLLDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GRL01', @level2type=N'COLUMN',@level2name=N'GRLLIUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GRL01', @level2type=N'COLUMN',@level2name=N'GRLLIDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the products table (PRO01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GRL01', @level2type=N'COLUMN',@level2name=N'GRLLPRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the warehouse table (PR.WAR01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GRL01', @level2type=N'COLUMN',@level2name=N'GRLLWAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line gross amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GRL01', @level2type=N'COLUMN',@level2name=N'GRLLLTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line discount amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GRL01', @level2type=N'COLUMN',@level2name=N'GRLDISC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line tax amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GRL01', @level2type=N'COLUMN',@level2name=N'GRLTAXE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line net to pay amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GRL01', @level2type=N'COLUMN',@level2name=N'GRLNETA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Goods receipt details table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'GRL01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Part of the composite primary key of the POL01 table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POL01', @level2type=N'COLUMN',@level2name=N'POLLIID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the POL01 table and foreign key that reference the PO header table (POH01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POL01', @level2type=N'COLUMN',@level2name=N'POLLIPO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product quantity' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POL01', @level2type=N'COLUMN',@level2name=N'POLLQUA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product price' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POL01', @level2type=N'COLUMN',@level2name=N'POLLPRI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POL01', @level2type=N'COLUMN',@level2name=N'POLLUSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POL01', @level2type=N'COLUMN',@level2name=N'POLLDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POL01', @level2type=N'COLUMN',@level2name=N'POLLIUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POL01', @level2type=N'COLUMN',@level2name=N'POLLIDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the products table (PRO01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POL01', @level2type=N'COLUMN',@level2name=N'POLLPRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line total' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POL01', @level2type=N'COLUMN',@level2name=N'POLLLTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line discount amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POL01', @level2type=N'COLUMN',@level2name=N'POLDISC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line tax amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POL01', @level2type=N'COLUMN',@level2name=N'POLTAXE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line net to pay amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POL01', @level2type=N'COLUMN',@level2name=N'POLNETA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Purchase order details table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POL01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the POR01 table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORRNID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Purchase order docment id' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORDOCN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Purchase order docment date' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORDODA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Purchase order document status' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORSTAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Purchase order document note' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORNOTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Purchase order document origin' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORORIG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Purchase order document origin type' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORORTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total gross amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORGROS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total discount amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORDISC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total tax amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORTAXE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total net to pay amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORNETA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORRNUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORRNDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORRNUU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORRNUD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the legal entities table (CO.LEG01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORLEGA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the business partners table (BP.BPA01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORBPAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the periods table (GL.PER01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORPERI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the documents type table (CO.DOC01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01', @level2type=N'COLUMN',@level2name=N'PORDOTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Purchase orders document header table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'POR01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Part of the composite primary key of the RFL01 table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFL01', @level2type=N'COLUMN',@level2name=N'RFLLIID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key that reference the request for quote headers (RFQ01) table, also primary key' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFL01', @level2type=N'COLUMN',@level2name=N'RFLRFQI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Desired quantity' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFL01', @level2type=N'COLUMN',@level2name=N'RFLLQUA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product price' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFL01', @level2type=N'COLUMN',@level2name=N'RFLLPRI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFL01', @level2type=N'COLUMN',@level2name=N'RFLLUSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFL01', @level2type=N'COLUMN',@level2name=N'RFLLDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFL01', @level2type=N'COLUMN',@level2name=N'RFLLIUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFL01', @level2type=N'COLUMN',@level2name=N'RFLLIDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the products table (PRO01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFL01', @level2type=N'COLUMN',@level2name=N'RFLLPRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the taxes table (TAX01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFL01', @level2type=N'COLUMN',@level2name=N'RFLTAID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line gross amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFL01', @level2type=N'COLUMN',@level2name=N'RFLLLTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line discount amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFL01', @level2type=N'COLUMN',@level2name=N'RFLDISC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line tax amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFL01', @level2type=N'COLUMN',@level2name=N'RFLTAXE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line net to pay amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFL01', @level2type=N'COLUMN',@level2name=N'RFLNETA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Request for quotes details table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFL01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the RFQ01 table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQPKID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Request for quote docment id' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQDOCN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Request for quote docment date' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Request for quote document status' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQSTAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Request for quote note' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQNOTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total gross amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQGROS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total discount amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQDISC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total tax amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQTAXE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total net to pay amount' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQNETA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQRNUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQRNDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQRNUU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQRNUD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the legal entities table (CO.LEG01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQLEGA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the business partners table (BP.BPA01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQBPAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the periods table (GL.PER01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQPERI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the documents type table (CO.DOC01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01', @level2type=N'COLUMN',@level2name=N'RFQDOTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Request for quote document header table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'RFQ01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for the VEN01 table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'VEN01', @level2type=N'COLUMN',@level2name=N'VENDSID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vendor''''s code' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'VEN01', @level2type=N'COLUMN',@level2name=N'VENCODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vendor''s name' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'VEN01', @level2type=N'COLUMN',@level2name=N'VENNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'VEN01', @level2type=N'COLUMN',@level2name=N'VENCBUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'VEN01', @level2type=N'COLUMN',@level2name=N'VENDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'VEN01', @level2type=N'COLUMN',@level2name=N'VENLUDB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'VEN01', @level2type=N'COLUMN',@level2name=N'VENLUDO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the G/L accounts table (GL.ACC01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'VEN01', @level2type=N'COLUMN',@level2name=N'VENACCO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the G/L organizations table (GL.ORG01)' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'VEN01', @level2type=N'COLUMN',@level2name=N'VENORGA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vendors mater data table' , @level0type=N'SCHEMA',@level0name=N'AP', @level1type=N'TABLE',@level1name=N'VEN01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for the CUS01 table' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'CUS01', @level2type=N'COLUMN',@level2name=N'CUSTSID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The customer''''s code' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'CUS01', @level2type=N'COLUMN',@level2name=N'CUSTCOD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The customer''s company name' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'CUS01', @level2type=N'COLUMN',@level2name=N'CUSTNAM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'CUS01', @level2type=N'COLUMN',@level2name=N'CUSTOUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'CUS01', @level2type=N'COLUMN',@level2name=N'CUSTDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'CUS01', @level2type=N'COLUMN',@level2name=N'CUSTUDB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'CUS01', @level2type=N'COLUMN',@level2name=N'CUSTUDO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the G/L accounts table (GL.ACC01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'CUS01', @level2type=N'COLUMN',@level2name=N'CUSTACC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the G/L organizations table (GL.ORG01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'CUS01', @level2type=N'COLUMN',@level2name=N'CUSTORG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The customers mater data table' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'CUS01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Part of the composite primary key of the QUO01 table' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QLI01', @level2type=N'COLUMN',@level2name=N'QLILIID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key that reference the quotes headers (QUO01) table, also primary key' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QLI01', @level2type=N'COLUMN',@level2name=N'QLILIBI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product quantity' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QLI01', @level2type=N'COLUMN',@level2name=N'QLILQUA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product price' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QLI01', @level2type=N'COLUMN',@level2name=N'QLILPRI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QLI01', @level2type=N'COLUMN',@level2name=N'QLILUSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QLI01', @level2type=N'COLUMN',@level2name=N'QLILDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QLI01', @level2type=N'COLUMN',@level2name=N'QLILIUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QLI01', @level2type=N'COLUMN',@level2name=N'QLILIDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the products table (PR.PRO01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QLI01', @level2type=N'COLUMN',@level2name=N'QLILPRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the products table (GL.TAX01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QLI01', @level2type=N'COLUMN',@level2name=N'QLITAID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line gross amount' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QLI01', @level2type=N'COLUMN',@level2name=N'QLILLTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line discount amount' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QLI01', @level2type=N'COLUMN',@level2name=N'QLIDISC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line tax amount' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QLI01', @level2type=N'COLUMN',@level2name=N'QLITAXE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line net to pay amount' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QLI01', @level2type=N'COLUMN',@level2name=N'QLINETA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quotes details table' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QLI01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the QUO01 table' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUOTEID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quote docment id' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUODOCN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quote docment date' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUODODA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quote document status' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUOSTAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quote document note' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUONOTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total gross amount' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUOGROS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total discount amount' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUODISC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total tax amount' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUOTAXE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total net to pay amount' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUONETA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUORNUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUORNDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUORNUU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUORNUD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the legal entities table (CO.LEG01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUOLEGA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the business partners table (BP.BPA01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUOBPAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the periods table (GL.PER01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUOPERI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the documents type table (CO.DOC01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01', @level2type=N'COLUMN',@level2name=N'QUODOTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quotes document header table' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'QUO01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the SOH01 table' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOH01', @level2type=N'COLUMN',@level2name=N'SOHRNID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sale order status' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOH01', @level2type=N'COLUMN',@level2name=N'SOHSTAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOH01', @level2type=N'COLUMN',@level2name=N'SOHRNUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOH01', @level2type=N'COLUMN',@level2name=N'SOHRNDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOH01', @level2type=N'COLUMN',@level2name=N'SOHRNUU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOH01', @level2type=N'COLUMN',@level2name=N'SOHRNUD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the G/L organizations table (GL.ORG01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOH01', @level2type=N'COLUMN',@level2name=N'SOHORGA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the customers table (CUS01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOH01', @level2type=N'COLUMN',@level2name=N'SOHCUST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales order document header table' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOH01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Part of the composite primary key of the SOL01 table' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOL01', @level2type=N'COLUMN',@level2name=N'SOLLIID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the SOL01 table and foreign key that reference the SO header table (SOH01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOL01', @level2type=N'COLUMN',@level2name=N'SOLLISO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product quantity' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOL01', @level2type=N'COLUMN',@level2name=N'SOLLQUA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product price' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOL01', @level2type=N'COLUMN',@level2name=N'SOLLPRI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOL01', @level2type=N'COLUMN',@level2name=N'SOLLUSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOL01', @level2type=N'COLUMN',@level2name=N'SOLLDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOL01', @level2type=N'COLUMN',@level2name=N'SOLLIUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOL01', @level2type=N'COLUMN',@level2name=N'SOLLIDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the products table (PRO01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOL01', @level2type=N'COLUMN',@level2name=N'SOLLPRO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the taxes table (GL.TAX01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOL01', @level2type=N'COLUMN',@level2name=N'SOLTAID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line total' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOL01', @level2type=N'COLUMN',@level2name=N'SOLLLTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line discount amount' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOL01', @level2type=N'COLUMN',@level2name=N'SOLDISC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line tax amount' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOL01', @level2type=N'COLUMN',@level2name=N'SOLTAXE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line net to pay amount' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOL01', @level2type=N'COLUMN',@level2name=N'SOLNETA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sale order details table' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOL01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the SOR01 table' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORDRID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sale order docment id' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORDOCN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sale order docment date' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORDODA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sale order document status' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORSTAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sale order document note' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORNOTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sale order document origin' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORORIG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sale order document origin type' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORORTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total gross amount' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORGROS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total discount amount' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORDISC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total tax amount' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORTAXE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total net to pay amount' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORNETA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORRNUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORRNDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORRNUU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORRNUD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the legal entities table (CO.LEG01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORLEGA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the business partners table (BP.BPA01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORBPAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the periods table (GL.PER01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORPERI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the documents type table (CO.DOC01)' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01', @level2type=N'COLUMN',@level2name=N'SORDOTY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales orders document header table' , @level0type=N'SCHEMA',@level0name=N'AR', @level1type=N'TABLE',@level1name=N'SOR01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for the BPA01 table' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPA01', @level2type=N'COLUMN',@level2name=N'BUSIPID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The business partner''s code' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPA01', @level2type=N'COLUMN',@level2name=N'BUSICOD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The business partner''s name' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPA01', @level2type=N'COLUMN',@level2name=N'BUSINAM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The business partner type' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPA01', @level2type=N'COLUMN',@level2name=N'BUSITYP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPA01', @level2type=N'COLUMN',@level2name=N'BUSIOUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPA01', @level2type=N'COLUMN',@level2name=N'BUSIDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPA01', @level2type=N'COLUMN',@level2name=N'BUSIUDB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPA01', @level2type=N'COLUMN',@level2name=N'BUSIUDO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The business parteners mater data table' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPA01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for the BPD01 table' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPD01', @level2type=N'COLUMN',@level2name=N'BPDREID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Business partner address city' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPD01', @level2type=N'COLUMN',@level2name=N'BPDRCIT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Business partner address street' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPD01', @level2type=N'COLUMN',@level2name=N'BPDRSTR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Business partner address state/region' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPD01', @level2type=N'COLUMN',@level2name=N'BPDRSTA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Business partner address type (shipping or billing)' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPD01', @level2type=N'COLUMN',@level2name=N'BPDRTYP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart  created by column' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPD01', @level2type=N'COLUMN',@level2name=N'BUSIOUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPD01', @level2type=N'COLUMN',@level2name=N'BUSIDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart  last updated by column' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPD01', @level2type=N'COLUMN',@level2name=N'BUSIUDB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPD01', @level2type=N'COLUMN',@level2name=N'BUSIUDO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the countries table (CO.TER01)' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPD01', @level2type=N'COLUMN',@level2name=N'BPDRCOU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the business partners table (BPA01)' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPD01', @level2type=N'COLUMN',@level2name=N'BPDRBPI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Business partners address table' , @level0type=N'SCHEMA',@level0name=N'BP', @level1type=N'TABLE',@level1name=N'BPD01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the ADD01 table' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'ADD01', @level2type=N'COLUMN',@level2name=N'ADDREID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Column for cities information' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'ADD01', @level2type=N'COLUMN',@level2name=N'ADDRCIT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Column for street information' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'ADD01', @level2type=N'COLUMN',@level2name=N'ADDRSTR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Column for state/region information' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'ADD01', @level2type=N'COLUMN',@level2name=N'ADDRSTA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Column for  the address type' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'ADD01', @level2type=N'COLUMN',@level2name=N'ADDRTYP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'ADD01', @level2type=N'COLUMN',@level2name=N'ADDRUSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'ADD01', @level2type=N'COLUMN',@level2name=N'ADDRDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'ADD01', @level2type=N'COLUMN',@level2name=N'ADDRUUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'ADD01', @level2type=N'COLUMN',@level2name=N'ADDRUAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the countries table' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'ADD01', @level2type=N'COLUMN',@level2name=N'ADDRCOU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Locations master data table' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'ADD01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the BAN01 table' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'BAN01', @level2type=N'COLUMN',@level2name=N'BANKSID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The bank code' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'BAN01', @level2type=N'COLUMN',@level2name=N'BANKCOD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The bank name' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'BAN01', @level2type=N'COLUMN',@level2name=N'BANKNAM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'BAN01', @level2type=N'COLUMN',@level2name=N'BANKUSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'BAN01', @level2type=N'COLUMN',@level2name=N'BANKDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'BAN01', @level2type=N'COLUMN',@level2name=N'BANKUUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'BAN01', @level2type=N'COLUMN',@level2name=N'BANKUAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the countries table' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'BAN01', @level2type=N'COLUMN',@level2name=N'BANKTER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The banks master data table' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'BAN01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the DOC01 table' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'DOC01', @level2type=N'COLUMN',@level2name=N'DOCTYID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The doc type code' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'DOC01', @level2type=N'COLUMN',@level2name=N'DOCTCOD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The doc type description' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'DOC01', @level2type=N'COLUMN',@level2name=N'DOCTDES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The document types table' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'DOC01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the LEG01 table' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'LEG01', @level2type=N'COLUMN',@level2name=N'LEGALID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The legal entity name' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'LEG01', @level2type=N'COLUMN',@level2name=N'LEGALNA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The legal enity national registration ID' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'LEG01', @level2type=N'COLUMN',@level2name=N'LEGALEG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The legal enity fiscal ID' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'LEG01', @level2type=N'COLUMN',@level2name=N'LEGALIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'LEG01', @level2type=N'COLUMN',@level2name=N'LEGALSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'LEG01', @level2type=N'COLUMN',@level2name=N'LEGALAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'LEG01', @level2type=N'COLUMN',@level2name=N'LEGALPU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'LEG01', @level2type=N'COLUMN',@level2name=N'LEGALPD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to chart of accounts table (CHA01)' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'LEG01', @level2type=N'COLUMN',@level2name=N'LEGALCA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to addresses table (ADD01)' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'LEG01', @level2type=N'COLUMN',@level2name=N'LEGALHE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The legal entities master list table' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'LEG01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the TER01 table' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'TER01', @level2type=N'COLUMN',@level2name=N'TERRCOD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The territory name' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'TER01', @level2type=N'COLUMN',@level2name=N'TERRNAM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Language' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'TER01', @level2type=N'COLUMN',@level2name=N'TERRLAN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Source language' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'TER01', @level2type=N'COLUMN',@level2name=N'TERRSLA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the USR01 table' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERSID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user first name' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERFNA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user last name' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERLNA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user email address' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USEREMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user password' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERPAS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user role' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERROL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERUSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERUUP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERUPD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The users master data table' , @level0type=N'SCHEMA',@level0name=N'CO', @level1type=N'TABLE',@level1name=N'USR01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the ACC01 table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account code' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTNB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account name' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTNM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account description' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTDE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account type (balance sheet , P & L , ...)' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTTP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Allowing posting flag' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTPO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Allowing budgeting flag' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTBU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account status' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account level' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTLE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account group' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTGR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column ' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart updated by column ' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTUP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTUD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the charts of accounts table (CHA01)' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTCA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to this table (ACC01) designating the account parent' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01', @level2type=N'COLUMN',@level2name=N'ACCNTPA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Natural G/L Accounts master data table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACC01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for the ACS01 table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACS01', @level2type=N'COLUMN',@level2name=N'ACSTSID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The segment name' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACS01', @level2type=N'COLUMN',@level2name=N'ACSNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The segment description' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACS01', @level2type=N'COLUMN',@level2name=N'ACSDESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Segment maximum length' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACS01', @level2type=N'COLUMN',@level2name=N'ACSLENG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACS01', @level2type=N'COLUMN',@level2name=N'ACSNTUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACS01', @level2type=N'COLUMN',@level2name=N'ACSDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACS01', @level2type=N'COLUMN',@level2name=N'ACSNTUP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACS01', @level2type=N'COLUMN',@level2name=N'ACSNTUD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key that holds a reference to the charts of account table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACS01', @level2type=N'COLUMN',@level2name=N'ACSCOID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Table for accounts segments' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ACS01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for the AGP01 table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'AGP01', @level2type=N'COLUMN',@level2name=N'ACGRPID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account group parent account id' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'AGP01', @level2type=N'COLUMN',@level2name=N'ACGAPID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account group range start account' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'AGP01', @level2type=N'COLUMN',@level2name=N'ACGRPST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account group rang end account' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'AGP01', @level2type=N'COLUMN',@level2name=N'ACGRPEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'AGP01', @level2type=N'COLUMN',@level2name=N'ACGNTUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'AGP01', @level2type=N'COLUMN',@level2name=N'ACGNTDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'AGP01', @level2type=N'COLUMN',@level2name=N'ACGNTUP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'AGP01', @level2type=N'COLUMN',@level2name=N'ACGNTUD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key that holds a reference to the charts of account table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'AGP01', @level2type=N'COLUMN',@level2name=N'ACGRCOA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Table for account groups and their respective ranges' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'AGP01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the BAL01 balance table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BAL01', @level2type=N'COLUMN',@level2name=N'BALANCI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account begining total debit balance' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BAL01', @level2type=N'COLUMN',@level2name=N'BALANBD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account begining total credit balance' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BAL01', @level2type=N'COLUMN',@level2name=N'BALANBC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account period debit balance' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BAL01', @level2type=N'COLUMN',@level2name=N'BALANPD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account period credit balance' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BAL01', @level2type=N'COLUMN',@level2name=N'BALANPC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Balance last updated by' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BAL01', @level2type=N'COLUMN',@level2name=N'BALANUP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Balance last updated on' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BAL01', @level2type=N'COLUMN',@level2name=N'BALANUD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the accounts table (ACC01)' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BAL01', @level2type=N'COLUMN',@level2name=N'BALANAC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the journals items table (JLI01)' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BAL01', @level2type=N'COLUMN',@level2name=N'BALANJL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the journal items table (JLI01)' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BAL01', @level2type=N'COLUMN',@level2name=N'BALANJI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the periods table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BAL01', @level2type=N'COLUMN',@level2name=N'BALANPE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the ledger table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BAL01', @level2type=N'COLUMN',@level2name=N'BALANLE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the currency table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BAL01', @level2type=N'COLUMN',@level2name=N'BALANCU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Daily account balances table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BAL01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the BUD01 table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUD01', @level2type=N'COLUMN',@level2name=N'BUDGETI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The budget name' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUD01', @level2type=N'COLUMN',@level2name=N'BUDGETN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A budget description' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUD01', @level2type=N'COLUMN',@level2name=N'BUDGETD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The budget status' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUD01', @level2type=N'COLUMN',@level2name=N'BUDGETS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUD01', @level2type=N'COLUMN',@level2name=N'BUDGETU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUD01', @level2type=N'COLUMN',@level2name=N'BUDGETA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUD01', @level2type=N'COLUMN',@level2name=N'BUDGEDU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUD01', @level2type=N'COLUMN',@level2name=N'BUDGEUD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the periods table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUD01', @level2type=N'COLUMN',@level2name=N'BUDGECA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the ledger table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUD01', @level2type=N'COLUMN',@level2name=N'BUDGETL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Budgets master data table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUD01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Part of the composite primary key of the BUL01 table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUL01', @level2type=N'COLUMN',@level2name=N'BULLILI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key and foreign key to the  master table (BUD01)' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUL01', @level2type=N'COLUMN',@level2name=N'BULLIBU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The account bugdet for the period' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUL01', @level2type=N'COLUMN',@level2name=N'BULLIAM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart  created by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUL01', @level2type=N'COLUMN',@level2name=N'BULLUSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart  created on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUL01', @level2type=N'COLUMN',@level2name=N'BULLDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart  last updated by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUL01', @level2type=N'COLUMN',@level2name=N'BULLIUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart  last updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUL01', @level2type=N'COLUMN',@level2name=N'BULLIDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the accounts table (ACC01)' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'BUL01', @level2type=N'COLUMN',@level2name=N'BULLACC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the CAL01 table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CAL01', @level2type=N'COLUMN',@level2name=N'CALENID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The calendar name' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CAL01', @level2type=N'COLUMN',@level2name=N'CALENDN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The calendar status' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CAL01', @level2type=N'COLUMN',@level2name=N'CALENDS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CAL01', @level2type=N'COLUMN',@level2name=N'CALENDU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CAL01', @level2type=N'COLUMN',@level2name=N'CALENDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CAL01', @level2type=N'COLUMN',@level2name=N'CALENDP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CAL01', @level2type=N'COLUMN',@level2name=N'CALENLU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The calendars master data table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CAL01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the CHA01 table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CHA01', @level2type=N'COLUMN',@level2name=N'COASIDS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the chart' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CHA01', @level2type=N'COLUMN',@level2name=N'COANAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A short description for the chart' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CHA01', @level2type=N'COLUMN',@level2name=N'COASDES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A long description for the chart' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CHA01', @level2type=N'COLUMN',@level2name=N'COADESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chart base maintenance language' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CHA01', @level2type=N'COLUMN',@level2name=N'COALANG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CHA01', @level2type=N'COLUMN',@level2name=N'COAUSER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on  column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CHA01', @level2type=N'COLUMN',@level2name=N'COADATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CHA01', @level2type=N'COLUMN',@level2name=N'COAUPUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CHA01', @level2type=N'COLUMN',@level2name=N'COAUPDD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Charts of accounts master data table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CHA01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the CUR01 table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CUR01', @level2type=N'COLUMN',@level2name=N'CURRENI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The currency code' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CUR01', @level2type=N'COLUMN',@level2name=N'CURRENC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The currency name' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CUR01', @level2type=N'COLUMN',@level2name=N'CURRENN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The currency symbol' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CUR01', @level2type=N'COLUMN',@level2name=N'CURRENS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The currency status (enabled or disabled)' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CUR01', @level2type=N'COLUMN',@level2name=N'CURRENG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The currency start date (enabled from)' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CUR01', @level2type=N'COLUMN',@level2name=N'CURREND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The currency end date (enabled until)' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CUR01', @level2type=N'COLUMN',@level2name=N'CURRENE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CUR01', @level2type=N'COLUMN',@level2name=N'CURRENU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CUR01', @level2type=N'COLUMN',@level2name=N'CURRENA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CUR01', @level2type=N'COLUMN',@level2name=N'CURRENL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CUR01', @level2type=N'COLUMN',@level2name=N'CURRENB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the countries table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CUR01', @level2type=N'COLUMN',@level2name=N'CURRENF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The currencies master data table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'CUR01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the JHE01 table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The journal name' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNNA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The journal description' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNDE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The journal source' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The journal status' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Actual flag' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNAF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Balanced flag' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNBF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total journal credits' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNTC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total journal debits' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNTD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNUU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNUD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the jounals category table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNCA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the currency table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNCU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the ledger table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNLE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the periods table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01', @level2type=N'COLUMN',@level2name=N'JOURNPE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'G/L journal header table ' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JHE01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Part of the primary key for the JRNLILI table.This columns is for the details line.' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JLI01', @level2type=N'COLUMN',@level2name=N'JRNLILI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Part of the primary key for the JRNLILI table.Also a foreign key to JHE01 table.' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JLI01', @level2type=N'COLUMN',@level2name=N'JRNLIJI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Debit/Credit Indicator.' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JLI01', @level2type=N'COLUMN',@level2name=N'JRNLIDC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The amount to debit or credit the account with.' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JLI01', @level2type=N'COLUMN',@level2name=N'JRNLIAM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JLI01', @level2type=N'COLUMN',@level2name=N'JRNLUSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JLI01', @level2type=N'COLUMN',@level2name=N'JRNLDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JLI01', @level2type=N'COLUMN',@level2name=N'JRNLIUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JLI01', @level2type=N'COLUMN',@level2name=N'JRNLIDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the accounts table (ACC01)' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JLI01', @level2type=N'COLUMN',@level2name=N'JRNLACC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'G/L journal details table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'JLI01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the LED01 table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'LED01', @level2type=N'COLUMN',@level2name=N'LEDGERI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The ledger name' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'LED01', @level2type=N'COLUMN',@level2name=N'LEDGERN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ledger description' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'LED01', @level2type=N'COLUMN',@level2name=N'LEDGERD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'LED01', @level2type=N'COLUMN',@level2name=N'LEDGERU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'LED01', @level2type=N'COLUMN',@level2name=N'LEDGERA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'LED01', @level2type=N'COLUMN',@level2name=N'LEDGERS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'LED01', @level2type=N'COLUMN',@level2name=N'LEDGERL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the chart of accounts table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'LED01', @level2type=N'COLUMN',@level2name=N'LEDGERC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the currencies table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'LED01', @level2type=N'COLUMN',@level2name=N'LEDGERR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the calendar table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'LED01', @level2type=N'COLUMN',@level2name=N'LEDGERT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The ledgers master data table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'LED01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the ORG01 table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ORG01', @level2type=N'COLUMN',@level2name=N'ORGANID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The organization name' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ORG01', @level2type=N'COLUMN',@level2name=N'ORGANNA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The organization official registered id with local authorities' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ORG01', @level2type=N'COLUMN',@level2name=N'ORGANEG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The organization official fiscal id , if she is subject to taxation' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ORG01', @level2type=N'COLUMN',@level2name=N'ORGANIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The organization sector' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ORG01', @level2type=N'COLUMN',@level2name=N'ORGANEC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The organization type' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ORG01', @level2type=N'COLUMN',@level2name=N'ORGANYP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ORG01', @level2type=N'COLUMN',@level2name=N'ORGANSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ORG01', @level2type=N'COLUMN',@level2name=N'ORGANAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ORG01', @level2type=N'COLUMN',@level2name=N'ORGANPU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ORG01', @level2type=N'COLUMN',@level2name=N'ORGANPD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the address table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ORG01', @level2type=N'COLUMN',@level2name=N'ORGANDD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the ledger table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ORG01', @level2type=N'COLUMN',@level2name=N'ORGANLE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The organizations master data table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'ORG01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the PER01 table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'PER01', @level2type=N'COLUMN',@level2name=N'PERIODI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The period name' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'PER01', @level2type=N'COLUMN',@level2name=N'PERIODN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The period start date' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'PER01', @level2type=N'COLUMN',@level2name=N'PERIODS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The period end date' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'PER01', @level2type=N'COLUMN',@level2name=N'PERIODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Period for adjustment flag' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'PER01', @level2type=N'COLUMN',@level2name=N'PERIODA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The period status' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'PER01', @level2type=N'COLUMN',@level2name=N'PERIODT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'PER01', @level2type=N'COLUMN',@level2name=N'PERIODU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'PER01', @level2type=N'COLUMN',@level2name=N'PERIODD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'PER01', @level2type=N'COLUMN',@level2name=N'PERIODL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'PER01', @level2type=N'COLUMN',@level2name=N'PERIODM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the calendar table (CAL01)' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'PER01', @level2type=N'COLUMN',@level2name=N'PERIODC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The periods master data table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'PER01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the RAT01 table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'RAT01', @level2type=N'COLUMN',@level2name=N'RATEIDS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rate value column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'RAT01', @level2type=N'COLUMN',@level2name=N'RATEDVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rate start date' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'RAT01', @level2type=N'COLUMN',@level2name=N'RATESDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rate end date' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'RAT01', @level2type=N'COLUMN',@level2name=N'RATEEDA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'RAT01', @level2type=N'COLUMN',@level2name=N'RATEUSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'RAT01', @level2type=N'COLUMN',@level2name=N'RATEDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'RAT01', @level2type=N'COLUMN',@level2name=N'RATEUPU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'RAT01', @level2type=N'COLUMN',@level2name=N'RATEUPD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds a reference to the currencies table to represent the currency source' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'RAT01', @level2type=N'COLUMN',@level2name=N'RATECUF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds a reference to the currencies table to represent the currency target' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'RAT01', @level2type=N'COLUMN',@level2name=N'RATECUT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The currencies rates table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'RAT01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the TAX01 table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'TAX01', @level2type=N'COLUMN',@level2name=N'TAXCODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The tax name' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'TAX01', @level2type=N'COLUMN',@level2name=N'TAXNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The taxe rate' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'TAX01', @level2type=N'COLUMN',@level2name=N'TAXRATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The tax type' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'TAX01', @level2type=N'COLUMN',@level2name=N'TAXTYPE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The tax start date' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'TAX01', @level2type=N'COLUMN',@level2name=N'TAXSTAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tax end date' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'TAX01', @level2type=N'COLUMN',@level2name=N'TAXEEND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'TAX01', @level2type=N'COLUMN',@level2name=N'TAXUSER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'TAX01', @level2type=N'COLUMN',@level2name=N'TAXDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'TAX01', @level2type=N'COLUMN',@level2name=N'TAXUUPD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'TAX01', @level2type=N'COLUMN',@level2name=N'TAXUATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the accounts table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'TAX01', @level2type=N'COLUMN',@level2name=N'TAXACCT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key  to the countries table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'TAX01', @level2type=N'COLUMN',@level2name=N'TAXTERR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The taxes master data table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'TAX01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the USR01 table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERSID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user first name' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERFNA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user last name' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERLNA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user email address' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USEREMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user password' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERPAS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user role' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERROL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERUSR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERUUP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'USR01', @level2type=N'COLUMN',@level2name=N'USERUPD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The users master data table' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'TABLE',@level1name=N'USR01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for the PFA01 table' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PFA01', @level2type=N'COLUMN',@level2name=N'PFATSID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product family name' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PFA01', @level2type=N'COLUMN',@level2name=N'PFANAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product family description' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PFA01', @level2type=N'COLUMN',@level2name=N'PFADESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PFA01', @level2type=N'COLUMN',@level2name=N'PFANTUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PFA01', @level2type=N'COLUMN',@level2name=N'PFADATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PFA01', @level2type=N'COLUMN',@level2name=N'PFALUDB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PFA01', @level2type=N'COLUMN',@level2name=N'PFALUDO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Products family table' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PFA01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key column for the products table' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODUCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product code' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODNUB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product name' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODTNM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product description' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODTDE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product current list price' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODTLP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product size' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODSIZ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The size unit measure code' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODSUM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product weight' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODWEI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The weight unit measure code' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODWUM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product class' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODCLA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product status' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODTST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product sell start date' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODSSD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product sell end date' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODSED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product discontinued date' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODDAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The standart created by column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODTUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The standart created on column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODTDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The standart updated by column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODTUP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODTUD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The foreign key to the product sub-family table (PSF01)' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01', @level2type=N'COLUMN',@level2name=N'PRODTSF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Products master data table' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PRO01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for the PSF01 table' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PSF01', @level2type=N'COLUMN',@level2name=N'PSFTSID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product sub-family name' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PSF01', @level2type=N'COLUMN',@level2name=N'PSFNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product sub-family description' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PSF01', @level2type=N'COLUMN',@level2name=N'PSFDESC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PSF01', @level2type=N'COLUMN',@level2name=N'PSFCBUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PSF01', @level2type=N'COLUMN',@level2name=N'PSFDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PSF01', @level2type=N'COLUMN',@level2name=N'PSFLUDB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PSF01', @level2type=N'COLUMN',@level2name=N'PSFLUDO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to the product family table (PFA01)' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PSF01', @level2type=N'COLUMN',@level2name=N'PSFPFFK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Products sub-family table' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'PSF01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for the WAR01 table' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'WAR01', @level2type=N'COLUMN',@level2name=N'WAREHID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The warehouse short description' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'WAR01', @level2type=N'COLUMN',@level2name=N'WAREDES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created by column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'WAR01', @level2type=N'COLUMN',@level2name=N'WAREHUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart created on column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'WAR01', @level2type=N'COLUMN',@level2name=N'WARDATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated by column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'WAR01', @level2type=N'COLUMN',@level2name=N'WARLUDB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standart last updated on column' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'WAR01', @level2type=N'COLUMN',@level2name=N'WARLUDO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Products family table' , @level0type=N'SCHEMA',@level0name=N'PR', @level1type=N'TABLE',@level1name=N'WAR01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 5
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CAL01 (GL)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PER01 (GL)"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 135
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'VIEW',@level1name=N'CAL01_VW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'VIEW',@level1name=N'CAL01_VW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CUR01 (GL)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TER01 (GL)"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'VIEW',@level1name=N'CUR01_VW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'GL', @level1type=N'VIEW',@level1name=N'CUR01_VW'
GO
USE [master]
GO
ALTER DATABASE [CBA] SET  READ_WRITE 
GO
