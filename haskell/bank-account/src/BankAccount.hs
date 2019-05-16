module BankAccount
  ( BankAccount
  , closeAccount
  , getBalance
  , incrementBalance
  , openAccount
  )
where

import Data.IORef

type BankAccount = IORef PureBankAccount

data PureBankAccount = PureBankAccount
  { balance :: Integer
  , closed :: Bool
  } deriving (Show)

closeAccount :: BankAccount -> IO ()
closeAccount account = do
  a <- readIORef account
  writeIORef account $ a { closed = True }

getBalance :: BankAccount -> IO (Maybe Integer)
getBalance account = do
  a <- readIORef account
  return $ if closed a then Nothing else Just $ balance a

incrementBalance :: BankAccount -> Integer -> IO (Maybe Integer)
incrementBalance account amount = do
  a <- readIORef account
  if closed a
    then return Nothing
    else do
      let updatedBalance = balance a + amount
      writeIORef account $ a { balance = updatedBalance }
      return $ Just updatedBalance

openAccount :: IO BankAccount
openAccount = newIORef $ PureBankAccount 0 False
