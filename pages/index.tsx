import Head from "next/head";
import Shell from "../components/shell";
import { EmojiHappyIcon } from "@heroicons/react/outline";

const Home = () => {
  return (
    <>
      <Head>
        <title>Small Wins</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <Shell>
        <h1 className="flex items-center gap-2 text-2xl">
          <EmojiHappyIcon className="w-6 h-6" />
          Hello!
        </h1>
      </Shell>
    </>
  );
};

export default Home;
