{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module URI.ByteString.Arbitrary where


-------------------------------------------------------------------------------
import           Control.Applicative
import           Data.Derive.Arbitrary     (makeArbitrary)
import           Data.DeriveTH             (derive)
import           Test.QuickCheck
import           Test.QuickCheck.Instances ()
-------------------------------------------------------------------------------
import           Prelude
-------------------------------------------------------------------------------
import           URI.ByteString
-------------------------------------------------------------------------------


instance Arbitrary UserInfo where
  arbitrary = UserInfo <$> arbitrary
                       <*> arbitrary


instance Arbitrary Authority where
  arbitrary = Authority <$> arbitrary
                        <*> arbitrary
                        <*> arbitrary


instance Arbitrary Host where
  arbitrary = Host <$> arbitrary


instance Arbitrary Port where
  arbitrary = Port <$> arbitrary


instance Arbitrary URI where
  arbitrary = URI <$> arbitrary
                  <*> arbitrary
                  <*> arbitrary
                  <*> arbitrary
                  <*> arbitrary


instance Arbitrary RelativeRef where
  arbitrary = RelativeRef <$> arbitrary
                          <*> arbitrary
                          <*> arbitrary
                          <*> arbitrary


instance Arbitrary Scheme where
  arbitrary = Scheme <$> arbitrary


instance Arbitrary Query where
  arbitrary = Query <$> arbitrary


instance Arbitrary PathSeg where
  arbitrary = PathSeg <$> arbitrary


instance Arbitrary PathSegMatrix where
  arbitrary = oneof [PathSegSimple <$> arbitrary, PathSegMatrix <$> arbitrary]


instance Arbitrary URIParserOptions where
  arbitrary = URIParserOptions <$> arbitrary


$(derive makeArbitrary ''SchemaError)
$(derive makeArbitrary ''URIParseError)
