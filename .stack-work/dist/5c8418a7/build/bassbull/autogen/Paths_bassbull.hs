{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_bassbull (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Dustin\\Desktop\\baseball\\bassbull\\.stack-work\\install\\d0705508\\bin"
libdir     = "C:\\Users\\Dustin\\Desktop\\baseball\\bassbull\\.stack-work\\install\\d0705508\\lib\\x86_64-windows-ghc-8.2.2\\bassbull-0.1.0.0-9Jwnww51hqkAMmQF1nSV6b-bassbull"
dynlibdir  = "C:\\Users\\Dustin\\Desktop\\baseball\\bassbull\\.stack-work\\install\\d0705508\\lib\\x86_64-windows-ghc-8.2.2"
datadir    = "C:\\Users\\Dustin\\Desktop\\baseball\\bassbull\\.stack-work\\install\\d0705508\\share\\x86_64-windows-ghc-8.2.2\\bassbull-0.1.0.0"
libexecdir = "C:\\Users\\Dustin\\Desktop\\baseball\\bassbull\\.stack-work\\install\\d0705508\\libexec\\x86_64-windows-ghc-8.2.2\\bassbull-0.1.0.0"
sysconfdir = "C:\\Users\\Dustin\\Desktop\\baseball\\bassbull\\.stack-work\\install\\d0705508\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "bassbull_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "bassbull_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "bassbull_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "bassbull_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "bassbull_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "bassbull_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
