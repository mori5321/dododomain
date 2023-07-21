{-# OPTIONS_GHC -fno-warn-unused-binds -fno-warn-name-shadowing 
    -fwarn-monomorphism-restriction -fwarn-hi-shadowing
 #-}

module Order (
    placeOrderWorkflow
) where

import Control.Monad ((>=>))


-- UnvalidatedOrder
data UnvalidatedOrder = UnvalidatedOrder UnvalidatedCustomerInfo UnvalidatedShipppingAddress UnvalidatedBillingAddress [UnvalidatedOrderLine]

data UnvalidatedCustomerInfo = UnvalidatedCustomerInfo
data UnvalidatedShipppingAddress = UnvalidatedShipppingAddress
data UnvalidatedBillingAddress = UnvalidatedBillingAddress
data UnvalidatedOrderLine = UnvalidatedOrderLine UnvalidatedProductCode UnvalidatedOrderQuantity

data UnvalidatedProductCode = UnvalidatedProductCode
data UnvalidatedOrderQuantity = UnvalidatedOrderQuantity


-- ValidatedOrder
data ValidatedOrder = ValidatedOrder ValidatedCustomerInfo ValidatedShipppingAddress ValidatedBillingAddress [ValidatedOrderLine]

data ValidatedCustomerInfo= ValidatedCustomerInfo
data ValidatedShipppingAddress = ValidatedShipppingAddress
data ValidatedBillingAddress = ValidatedBillingAddress
data ValidatedOrderLine = ValidatedOrderLine ValidatedProductCode ValidatedOrderQuantity

data ValidatedProductCode = ValidatedProductCode
data ValidatedOrderQuantity = ValidatedOrderQuantity

-- PlacedOrder
data PlacedOrder = PlacedOrder ValidatedOrderLine ValidatedShipppingAddress ValidatedBillingAddress [PricedOrderLine]

amountToBill :: PlacedOrder -> Double
amountToBill = undefined

data PricedOrderLine = PricedOrderLine ValidatedOrderLine LinePrice

data LinePrice = LinePrice
data PlacedOrderAcknowledgement = PlacedOrderAcknowledgement PlacedOrder AcknowledgementLetter

-- AcknowledgementLetter
data AcknowledgementLetter = AcknowledgementLetter


-- Workflow (たぶんあとでUsecase Layerになるやつ)
-- Input, Output は Eventとして表現すべきかもしれない
placeOrderWorkflow :: UnvalidatedOrder -> Either InvalidOrder PlacedOrder -- SideEffectを型で表現したい
placeOrderWorkflow = validateOrder >=> priceOrder >=> sendAcknowledgement

validateOrder :: UnvalidatedOrder -> Either InvalidOrder ValidatedOrder
validateOrder = undefined

priceOrder :: ValidatedOrder -> Either InvalidOrder PlacedOrder
priceOrder = undefined

sendAcknowledgement :: PlacedOrder -> Either InvalidOrder PlacedOrder -- Side Effectを型で表現したい
sendAcknowledgement = undefined

data InvalidOrder = InvalidOrder
