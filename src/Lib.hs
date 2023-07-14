module Lib
  ( someFunc,
    mkWidgetCode,
    mkGizmoCode,
    WidgetCode,
    GizmoCode,
    toString,
  )
where


someFunc :: IO ()
someFunc = putStrLn "someFunc"

data CodeError where
    LengthError :: InvalidLength -> CodeError
    FormatError :: InvalidFormat -> CodeError

-- data CodeError = LengthError InvalidLength | FormatError InvalidFormat
data InvalidLength = InvalidLength { expected :: Int, actual :: Int }
newtype InvalidFormat = InvalidFormat String

toString :: CodeError -> String
toString (LengthError (InvalidLength { expected, actual })) = "Expected: " ++ show expected ++ " Actual: " ++ show actual
toString (FormatError (InvalidFormat s)) = "Invalid format: " ++ s


newtype WidgetCode = WidgetCode String
mkWidgetCode :: String -> Either CodeError WidgetCode
mkWidgetCode s =
    if length s == 4
        then Right (WidgetCode s)
        else Left $ LengthError $ InvalidLength 4 (length s)


newtype GizmoCode = GizmoCode String
mkGizmoCode :: String -> Either CodeError GizmoCode
mkGizmoCode s =
    if length s == 4
        then Right (GizmoCode s)
        else Left $ LengthError $ InvalidLength 4 (length s)


